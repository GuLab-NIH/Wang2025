function [decd] = decoding(dfof,abf,trackStart,trackEnd)
%this code follows the method in this paper: https://www.sciencedirect.com/science/article/pii/S0896627321006929
% description in the paper: To decode position and context from neuronal activity data. We first split every dataset in two interleaved halves of template- and testing runs, respectively. Templates for population-vector based decoding were generated using the template runs by calculating the mean activity for each 5 cm bin on linear track A and B. The first and last bins on each track were omitted to mitigate potential errors due to small inhomogeneities in running speed, resulting in a total of 144 bins across both contexts. We then averaged neuronal activity from the testing data and calculated population activity vectors for each 100 ms bin. We then computed the Pearson correlation value for each of those population vectors with the template population vectors for each position. The most likely decoded location was then determined as the spatial bin that had the highest correlation with the population activity at a given time 

%odd number runs are tempalte data, even number runs are test. template
%data were binned in 5cm bins (n cell x all bins), so each column contains
%the activity of each cell in that particular location bin. For test data,
%directly use the data for all cells (the paper said 100 ms average but
%since our sampling is already 100ms, just use individual data point directly). Make a
%matrix for test data: n cell x all data points (frames).
%for each column in test data, compute its correlation to all the tempalte
%data columns and find the best correlation, so the bin of that column is
%the decoded spatial bin for that data point (that column in the test
%matrix). This basically says how well the population at that imaging frame
%fits to the population activity in certain location bins. Decoding error
%are the absoluste distance between each decoded bin and real bin.


%all calculations are speed thresholded
%default bin width is 5cm

%just need to input 
% dfof: normally use dfof. each row is one imaging frame, each column
% is one cell
% abf: contaning abf.y that has equal number of sampels (imaging frames) as dfof
%trackStart: 0
%trackEnd: length of the track in cm

% %output
% decd.dfofTest: dfof of the test data. Each column is one cell
% decd.tempBins: bins included as a template. The first and last bins of the track are removed.
% decd.avgTempUse: template that used for decoding. For each cell (column), this is the activity across all template runs
% decd.testYBins: real y bins of each test data point
% decd.decodeYBins: decoded y bins of each test data point
% decd.error: absolute errors in bins
% decd.meanError: mean error (mean of decd.error) in bins
% decd.perCorrect: percentage of correctly decoded track bins. Here "correct" means error=0. But in the learning paper, we considered "correct" to be no more than 5-bin error.
% 

abfStartNumber=1;
abfEndNumber=length(abf.y);
abfIms = abfStartNumber:abfEndNumber;
[speedThreshold]= speedThreshold1D( 1,length(abf.t),abf );
close;

binWidth=5;
trackLength=trackEnd-trackStart;
binCenters=(binWidth/2:binWidth:trackLength);
track=[0:binWidth:trackLength];
%get bins: n is the bin number
[y,nbin]=histc(abf.y(abf.imageIndex(abfStartNumber:abfEndNumber)),track);

%figure out indices in each run
speed=diff(abf.y);
fastEnough=[false ;speed>speedThreshold];
abfFastEnough = abf.imageIndex(abfIms(fastEnough));
[row,col]=find(speed<-100);
endIndicesP=[row' abfEndNumber]';
%this above should actually be this:endIndicesP=[row'-1 abfEndNumber]';
%the original one currently here is actually nearly the begining of the
%next run.
%but eventually this doesn't matter because the speed threshold got rid of
%it (FcuseSpeed=FcuseThis(fastEnough););
startIndicesP=[1 (row+1)']';
startIndices=startIndicesP(diff(startIndicesP)>1);
startIndices=[startIndices' startIndicesP(end)]';
%do the problem happens to the endIndices, solve it like this
endIndices=endIndicesP(diff([1 endIndicesP'])>1);

iS=length(startIndices);
iE=length(endIndices);

if iS~=iE;
    iSE=min([iS iE]);
    startIndices=startIndices(1:iSE);
    endIndices=endIndices(1:iSE);
end

%remove the first and the last runs (because incomplete)
startIndicesUse=startIndices(2:end-1);
endIndicesUse=endIndices(2:end-1);

%find odd and even runs and indices
runs=[1:1:length(startIndicesUse)];
iseven=rem(runs,2)==0;
evenRuns=runs(iseven);
oddRuns=runs(iseven==0);

evenRunsStartEnd=[];
oddRunsStartEnd=[];
evenRunsStartEnd(:,1)=startIndicesUse(evenRuns);
evenRunsStartEnd(:,2)=endIndicesUse(evenRuns);
oddRunsStartEnd(:,1)=startIndicesUse(evenRuns);
oddRunsStartEnd(:,2)=endIndicesUse(evenRuns);
% %randomly pick 80%
% per=0.8;
% N=round(length(startIndicesUse)*per);
% order=randperm(length(startIndicesUse));
% runUse=order(1:N);

%use odd runs as a tempalte
dfofMTemp=[];
tempRunsStartEnd=oddRunsStartEnd;

for n=1:size(dfof,2);
    disp(n);
dfofMTemp{n}=zeros(size(tempRunsStartEnd,1),trackLength/binWidth);
clear FcuseThis;
clear FcuseSpeed;
FcuseThis=dfof(:,n);
FcuseSpeed=FcuseThis(fastEnough);
[a,b]=find(FcuseSpeed);
if isempty(a);
    dfofMTemp{n}=[];
%     return
else

    for r=1:size(tempRunsStartEnd,1);
     clear FcuseThisRun;
    clear fastEnoughThisRun;
    clear nThisRun;
    FcuseThisRun=FcuseThis(tempRunsStartEnd(r,1):tempRunsStartEnd(r,2));
    fastEnoughThisRun=fastEnough(tempRunsStartEnd(r,1):tempRunsStartEnd(r,2));
    nThisRun=nbin(tempRunsStartEnd(r,1):tempRunsStartEnd(r,2));
    for binNumber=1:trackLength/binWidth;
    dfofMTemp{n}(r,binNumber)=mean(FcuseThisRun(nThisRun==binNumber&fastEnoughThisRun));
    end
    gaussianWindow=gausswin(3*5/binWidth,1);
[dfofMTemp{n}(r,:)]=gaussianSmoothWithNan(dfofMTemp{n}(r,:),gaussianWindow);
    end
end
end

avgTemp=[];%this is the template for decoding

for m=1:length(dfofMTemp);
    if ~isempty(dfofMTemp{m})
    A=mean(dfofMTemp{m},1);
    avgTemp(m,:)=A;
    else
        avgTemp(m,:)=zeros(1,trackLength/binWidth);
    end
end


%remaining even runs

testRunStartEnd=evenRunsStartEnd;
testUseIndices=[];
removeBins=[1 trackLength/binWidth];
for n=1:size(testRunStartEnd,1);
i=[testRunStartEnd(n,1):1:testRunStartEnd(n,2)];
fastEnoughThisRun=fastEnough(i);
i=i(fastEnoughThisRun);
nThisRun=nbin(i);
%remove the first and last bin
iRemove=[];
for m=1:length(removeBins);
    
iB=find(nThisRun==removeBins(m));
iRemove(end+1:end+length(iB))=iB;
end

iLeftIdx=setdiff([1:1:length(nThisRun)],iRemove);
iLeft=i(iLeftIdx);
testUseIndices(end+1:end+length(iLeft))=iLeft;
end

dfofTest=dfof(testUseIndices,:)';%row is cell, column is time
testYBins=nbin(testUseIndices);

%remove unwanted bins from avgTemp
useIdxAvg=setdiff([1:1:size(avgTemp,2)],removeBins);
avgTempUse=avgTemp(:,useIdxAvg);

%%%%%%%%%%%%%%%%%%%%%%%%% DECODE
decodeYBins=[];
allBins=[1:1:trackLength/binWidth];
tempBins=allBins(useIdxAvg);
for n=1:size(dfofTest,2);
    disp(n)
    c=[];
    test=dfofTest(:,n);
    for m=1:size(avgTempUse,2);
        c(m)=corr(test,avgTempUse(:,m));
    end

    [~,idecode]=max(c,[],'omitnan');
    decodeYBins(n,1)=tempBins(idecode);
end


%%%%%%%%%%%%%%%%%%%%%%%%%plot 
figure,plot(testYBins,'g.','MarkerSize',8)
hold on
plot(decodeYBins,'r.')
error=abs(testYBins-decodeYBins);
%percentage of points correctly decoded
per=length(find(error==0))/length(error);

title(['Mean error=',num2str(mean(error)),'bins, ',num2str(per),' percent was decoded']);
% saveas(gcf,'decode.fig');
decd.dfofTest=dfofTest;
decd.tempBins=tempBins;
decd.avgTempUse=avgTempUse;
decd.testYBins=testYBins;
decd.decodeYBins=decodeYBins;
decd.error=error;
decd.meanError=mean(error);
decd.perCorrect=per;
% save('decd.mat','decd')
end

