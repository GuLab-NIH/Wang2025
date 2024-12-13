copyfile('D:\GarretData\IdenticalCueData\environmentTemplate\temp_ENV2.mat','temp_ENV2.mat');
copyfile('D:\GarretData\IdenticalCueData\environmentTemplate\ENV2_CueBins.mat','ENV2_CueBins.mat');
load('temp_ENV2.mat');
load('ENV2_CueBins.mat');
temp=temp_ENV2; %cue template
c=ENV2_CueBins;

% use 95 percentile
load('D:\GarretData\IdenticalCueData\tracks234\cueCellsEachDay\cell95Idx.mat');
load('D:\GarretData\IdenticalCueData\allFolders.mat');
env=2;
day=1;

%calculate amplitude difference using both peak or mean
% for sequence correlation:


%creat folders and cell idx
useIdx=cell95Idx(:,env-1);
useFolders={};
p=pwd;
for n=1:length(allFolders)
    cd(allFolders{n});
    load('allDayEnv.mat')
    cd(allDayEnv{env}{day});
    d=dir('TSeries-*');
    
    for m=1:length(d)
    useFolders{end+1}=[d(m).folder '\' d(m).name '\suite2p'];
    end
end
cd(p)
save('useIdx.mat','useIdx')
save('useFolders.mat','useFolders');
%%
binWidth=5;
%move cue identify to the first column
cues=[];
cues(:,1)=c(:,3);%first column: cue identify 1 and 2: same number is the same cue
cues(:,[2 3])=c(:,[1 2]); %second and third columns: cue start and end
cues(:,4)=(cues(:,3)+cues(:,2))/2-0.5; %cue center in bin: for the cues with add number of bins, this is the end of the second bin
cues(:,5)=cues(:,4)*5; %cue center in cm

save('temp.mat','temp');
save('cues.mat','cues');

figure,plot(temp)
for n=1:size(cues,1);
    if cues(n,1)==1;
        hold on
        plot([cues(n,2):1:cues(n,3)],1,'g.');
    else
         hold on
        plot([cues(n,2):1:cues(n,3)],1,'m.');
    end
end

saveas(gcf,'templatePlot.fig')
close

%%
%all distances
allDistancesI=[];%all distances betwen identical cues: cue numbers are the row numbers in "cues"
allDistancesNI=[];%all distances betwen non-identical cues: cue numbers are the row numbers in "cues"

%first column is one cue, second column is the second cue, the third column is their distances in bins, and the last one
%is their distances in cm.

%identical cue combinations
idxI=[];
%the both types of cue
cueType=[1 2];
for ct=1:length(cueType)
i=find(cues(:,1)==cueType(ct));
for n=1:length(i)-1;
    for m=n+1:length(i);
        thisPair=[i(n) i(m)];
        idxI=[idxI;thisPair];
    end
end
end

allDistancesI=idxI;%the first and second columns are the two cues
%the 3rd column is the distance between cue centers by bin
for n=1:size(allDistancesI,1);
    allDistancesI(n,3)=abs(cues(allDistancesI(n,1),4)-cues(allDistancesI(n,2),4));
    allDistancesI(n,4)=allDistancesI(n,3)*binWidth;
end
[~,i]=sort(allDistancesI(:,4));
allDistancesI=allDistancesI(i,:);

%non identical cue combinations
idxNI=[];
%the first type of cue
i1=find(cues(:,1)==1);
i2=find(cues(:,1)==2);
for n=1:length(i1);
    for m=1:length(i2);
        thisPair=[i1(n) i2(m)];
        idxNI=[idxNI;thisPair];
    end
end

allDistancesNI=idxNI;%the first and second columns are the two cues
%the 3rd column is the distance between cue centers by bin
for n=1:size(allDistancesNI,1);
    allDistancesNI(n,3)=abs(cues(allDistancesNI(n,1),4)-cues(allDistancesNI(n,2),4));
    allDistancesNI(n,4)=allDistancesNI(n,3)*binWidth;
end
[~,i]=sort(allDistancesNI(:,4));
allDistancesNI=allDistancesNI(i,:);

save('allDistancesNI.mat','allDistancesNI');
save('allDistancesI.mat','allDistancesI');

% group the same distances in cells
allDistancesIGroup={};
allDistancesIGroup{1}=allDistancesI([1 2],:);
allDistancesIGroup{2}=allDistancesI(3,:);
allDistancesIGroup{3}=allDistancesI(4,:);
allDistancesIGroup{4}=allDistancesI(5,:);
allDistancesIGroup{5}=allDistancesI(6,:);
allDistancesIGroup{6}=allDistancesI(7,:);

allDistancesNIGroup={};
allDistancesNIGroup{1}=allDistancesNI(1,:);
allDistancesNIGroup{2}=allDistancesNI([2 3],:);
allDistancesNIGroup{3}=allDistancesNI(4,:);
allDistancesNIGroup{4}=allDistancesNI(5,:);
allDistancesNIGroup{5}=allDistancesNI(6,:);
allDistancesNIGroup{6}=allDistancesNI(7,:);
allDistancesNIGroup{7}=allDistancesNI(8,:);

save('allDistancesNIGroup.mat','allDistancesNIGroup');
save('allDistancesIGroup.mat','allDistancesIGroup');

%% amplitude differences

load('useIdx.mat');
load('useFolders.mat')
load('allDistancesIGroup.mat')
load('allDistancesNIGroup.mat')
p=pwd;
cueCellDataThresh=95;
[ampDiffIMean,ampDiffNIMean,ampDiffIPeak,ampDiffNIPeak] = ampDiff(useIdx,useFolders,allDistancesIGroup,allDistancesNIGroup,cueCellDataThresh);

save('ampDiffIMean.mat','ampDiffIMean');
save('ampDiffIPeak.mat','ampDiffIPeak');
save('ampDiffNIMean.mat','ampDiffNIMean');
save('ampDiffNIPeak.mat','ampDiffNIPeak');



%% plot them
ampDiffIMeanAll={};% if there are two cells, merge them
ampDiffIMeanMean=[];%mean
ampDiffIMeanSEM=[];
for n=1:length(ampDiffIMean);
    a=ampDiffIMean{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';

        ampDiffIMeanAll{n}=aa;
        ampDiffIMeanMean(n)=nanmean(aa);
        ampDiffIMeanSEM(n)=nansem(aa,2);

end

ampDiffIPeakAll={};% if there are two cells, merge them
ampDiffIPeakMean=[];%mean
ampDiffIPeakSEM=[];
for n=1:length(ampDiffIPeak);
     a=ampDiffIPeak{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';

        ampDiffIPeakAll{n}=aa;
        ampDiffIPeakMean(n)=nanmean(aa);
        ampDiffIPeakSEM(n)=nansem(aa,2);

end

distanceOnlyI=unique(allDistancesI(:,end));

ampDiffNIMeanAll={};% if there are two cells, merge them
ampDiffNIMeanMean=[];%mean
ampDiffNIMeanSEM=[];
for n=1:length(ampDiffNIMean);
        a=ampDiffNIMean{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
    
        ampDiffNIMeanAll{n}=aa;
        ampDiffNIMeanMean(n)=nanmean(aa);
        ampDiffNIMeanSEM(n)=nansem(aa,2);

end

ampDiffNIPeakAll={};% if there are two cells, merge them
ampDiffNIPeakMean=[];%mean
ampDiffNIPeakSEM=[];
for n=1:length(ampDiffNIPeak);
            a=ampDiffNIPeak{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
    
        ampDiffNIPeakAll{n}=aa;
        ampDiffNIPeakMean(n)=nanmean(aa);
        ampDiffNIPeakSEM(n)=nansem(aa,2);

end
distanceOnlyNI=unique(allDistancesNI(:,end));

figure
subplot(221)

errorbar(distanceOnlyI,ampDiffIMeanMean,ampDiffIMeanSEM,'g')
hold on
errorbar(distanceOnlyNI,ampDiffNIMeanMean,ampDiffNIMeanSEM,'m')
title('ampDifferences mean');

subplot(222)

errorbar(distanceOnlyI,ampDiffIPeakMean,ampDiffIPeakSEM,'g')
hold on
errorbar(distanceOnlyNI,ampDiffNIPeakMean,ampDiffNIPeakSEM,'m')
title('ampDifferences peak');

%no distances, just include all
I=cell2mat(ampDiffIMeanAll);
NI=cell2mat(ampDiffNIMeanAll);
M=[];
M(1)=nanmean(I);
M(2)=nanmean(NI);
S=[];
S(1)=nansem(I,2);
S(2)=nansem(NI,2);
subplot(223)
bar([1 2],M)
hold on
errorbar([1 2],M,S,'.')
names={'Iden'; 'Noniden' };
set(gca,'xticklabel',names)
[r,p1]=ttest2(I,NI);
title(['mean p=',num2str(p1)])

%no distances, just include all
I=cell2mat(ampDiffIPeakAll);
NI=cell2mat(ampDiffNIPeakAll);
M=[];
M(1)=nanmean(I);
M(2)=nanmean(NI);
S=[];
S(1)=nansem(I,2);
S(2)=nansem(NI,2);
subplot(224)
bar([1 2],M)
hold on
errorbar([1 2],M,S,'.')
names={'Iden'; 'Noniden' };
set(gca,'xticklabel',names)
[r,p1]=ttest2(I,NI);
title(['Peak p=',num2str(p1)])

saveas(gcf,'ampDifferences.fig')

%only use matched distances
idxI=[1 3 5 6];
idxNI=[1 3 5 6];
figure
subplot(221)

errorbar(distanceOnlyI(idxI),ampDiffIMeanMean(idxI),ampDiffIMeanSEM(idxI),'g')
hold on
errorbar(distanceOnlyNI(idxNI),ampDiffNIMeanMean(idxNI),ampDiffNIMeanSEM(idxNI),'m')

%STATs
ITemp=ampDiffIMeanAll(idxI);
NITemp=ampDiffNIMeanAll(idxNI);
I=[];
NI=[];

for n=1:length(idxI);
I(:,n)=ITemp{n}';
NI(:,n)=NITemp{n}';
end

 [pAnova,pMC,pLabel] = anovaRM2W_full_BH(I,NI,1);
title(['ampDifferences mean pAnova',num2str(pAnova(1))]);

subplot(222)

errorbar(distanceOnlyI(idxI),ampDiffIPeakMean(idxI),ampDiffIPeakSEM(idxI),'g')
hold on
errorbar(distanceOnlyNI(idxNI),ampDiffNIPeakMean(idxNI),ampDiffNIPeakSEM(idxNI),'m')

%STATs
ITemp=ampDiffIPeakAll(idxI);
NITemp=ampDiffNIPeakAll(idxNI);
I=[];
NI=[];

for n=1:length(idxI);
I(:,n)=ITemp{n}';
NI(:,n)=NITemp{n}';
end

 [pAnova,pMC,pLabel] = anovaRM2W_full_BH(I,NI,1);
title(['ampDifferences peak pAnova',num2str(pAnova(1))]);

%no distances, just include all
I=cell2mat(ampDiffIMeanAll(idxI));
NI=cell2mat(ampDiffNIMeanAll(idxNI));
M=[];
M(1)=nanmean(I);
M(2)=nanmean(NI);
S=[];
S(1)=nansem(I,2);
S(2)=nansem(NI,2);
subplot(223)
bar([1 2],M)
hold on
errorbar([1 2],M,S,'.')
names={'Iden'; 'Noniden' };
set(gca,'xticklabel',names)
[r,p1]=ttest2(I,NI);
title(['mean p=',num2str(p1)])

%no distances, just include all
I=cell2mat(ampDiffIPeakAll(idxI));
NI=cell2mat(ampDiffNIPeakAll(idxNI));
M=[];
M(1)=nanmean(I);
M(2)=nanmean(NI);
S=[];
S(1)=nansem(I,2);
S(2)=nansem(NI,2);
subplot(224)
bar([1 2],M)
hold on
errorbar([1 2],M,S,'.')
names={'Iden'; 'Noniden' };
set(gca,'xticklabel',names)
[r,p1]=ttest2(I,NI);
title(['Peak p=',num2str(p1)])

saveas(gcf,'ampDifferencesMatchedDistance.fig')
%% get all lags
cueCellDataThresh=95;
load('useIdx.mat');
load('useFolders.mat');
p=pwd;
lags={};
for n=1:length(useIdx);
    lags{n}=[];
    disp(n)
    cd(useFolders{n});
    cells=useIdx{n};
    if cueCellDataThresh==95;
        filename1='cueAnalysis_sig\newScoreShuffleTemplate\cueCellsAllThresh.mat';
        filename2='cueCellsAllThresh';
    else
        filename1=sprintf('%s%d.mat','cueAnalysis_sig\newScoreShuffleTemplate\cueCellsAllThresh',cueCellDataThresh);
        filename2=['cueCellsAllThresh',num2str(cueCellDataThresh)];
    end

    load(filename1);
    data=eval(filename2);
    [~,useCellIdx,~]=intersect(data.realIdx,cells);
     lags{n}=data.lags(useCellIdx);
end

cd(p);
save('lags.mat','lags');

%% get all dfofs
cueCellDataThresh=95;
load('useIdx.mat');
load('useFolders.mat');
p=pwd;
dfofs={};
for n=1:length(useIdx);
    dfofs{n}=[];
    disp(n)
    cd(useFolders{n});
    cells=useIdx{n};
    if cueCellDataThresh==95;
        filename1='cueAnalysis_sig\newScoreShuffleTemplate\cueCellsAllThresh.mat';
        filename2='cueCellsAllThresh';
    else
        filename1=sprintf('%s%d.mat','cueAnalysis_sig\newScoreShuffleTemplate\cueCellsAllThresh',cueCellDataThresh);
        filename2=['cueCellsAllThresh',num2str(cueCellDataThresh)];
    end

    load(filename1);
    data=eval(filename2);
    [~,useCellIdx,~]=intersect(data.realIdx,cells);
    dfofs{n}=data.dfofAvg(:,useCellIdx);
end

cd(p);
save('dfofs.mat','dfofs');








%% calculate correlation
load('useIdx.mat');
load('useFolders.mat')
load('allDistancesIGroup.mat')
load('allDistancesNIGroup.mat')
p=pwd;

cueCellDataThresh=95;
% number of cells per sequence
NCell=15;
% number of shuffles
NShuffle=100;  
NCellFolders=[];
for n=1:length(useIdx);
    NCellFolders(n)=length(useIdx{n});
end

iUse=find(NCellFolders>NCell);
useIdxN=useIdx(iUse);
useFoldersN=useFolders(iUse);

[randomCells,corrIMean,corrNIMean,corrIPeak,corrNIPeak] = corrAtCues_NCellFOV(useIdxN,useFoldersN,allDistancesIGroup,allDistancesNIGroup,cueCellDataThresh,NCell);

save('corrIMean.mat','corrIMean');
save('corrIPeak.mat','corrIPeak');
save('corrNIMean.mat','corrNIMean');
save('corrNIPeak.mat','corrNIPeak');
save('randomCells.mat','randomCells');

%% plot corr
corrIMeanAll={};% if there are two cells, merge them
corrIMeanMean=[];%mean
corrIMeanSEM=[];
for n=1:length(corrIMean);
            a=corrIMean{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';

        corrIMeanAll{n}=aa;
        corrIMeanMean(n)=nanmean(aa);
        corrIMeanSEM(n)=nansem(aa,2);

end

corrIPeakAll={};% if there are two cells, merge them
corrIPeakMean=[];%mean
corrIPeakSEM=[];
for n=1:length(corrIPeak);

                a=corrIPeak{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
    
        corrIPeakAll{n}=aa;
        corrIPeakMean(n)=nanmean(aa);
        corrIPeakSEM(n)=nansem(aa,2);

end

distanceOnlyI=unique(allDistancesI(:,end));

corrNIMeanAll={};% if there are two cells, merge them
corrNIMeanMean=[];%mean
corrNIMeanSEM=[];
for n=1:length(corrNIMean);

                a=corrNIMean{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
    
        corrNIMeanAll{n}=aa;
        corrNIMeanMean(n)=nanmean(aa);
        corrNIMeanSEM(n)=nansem(aa,2);

end

corrNIPeakAll={};% if there are two cells, merge them
corrNIPeakMean=[];%mean
corrNIPeakSEM=[];
for n=1:length(corrNIPeak);
                    a=corrNIPeak{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
    
        corrNIPeakAll{n}=aa;
        corrNIPeakMean(n)=nanmean(aa);
        corrNIPeakSEM(n)=nansem(aa,2);

end
distanceOnlyNI=unique(allDistancesNI(:,end));

figure
subplot(221)

errorbar(distanceOnlyI,corrIMeanMean,corrIMeanSEM,'g')
hold on
errorbar(distanceOnlyNI,corrNIMeanMean,corrNIMeanSEM,'m')
title('corr mean');

subplot(222)

errorbar(distanceOnlyI,corrIPeakMean,corrIPeakSEM,'g')
hold on
errorbar(distanceOnlyNI,corrNIPeakMean,corrNIPeakSEM,'m')
title('corr peak');

%no distances, just include all
I=cell2mat(corrIMeanAll);
NI=cell2mat(corrNIMeanAll);
M=[];
M(1)=nanmean(I);
M(2)=nanmean(NI);
S=[];
S(1)=nansem(I,2);
S(2)=nansem(NI,2);
subplot(223)
bar([1 2],M)
hold on
errorbar([1 2],M,S,'.')
names={'Iden'; 'Noniden' };
set(gca,'xticklabel',names)
[r,p1]=ttest2(I,NI);
title(['mean p=',num2str(p1)])

%no distances, just include all
I=cell2mat(corrIPeakAll);
NI=cell2mat(corrNIPeakAll);
M=[];
M(1)=nanmean(I);
M(2)=nanmean(NI);
S=[];
S(1)=nansem(I,2);
S(2)=nansem(NI,2);
subplot(224)
bar([1 2],M)
hold on
errorbar([1 2],M,S,'.')
names={'Iden'; 'Noniden' };
set(gca,'xticklabel',names)
[r,p1]=ttest2(I,NI);
title(['Peak p=',num2str(p1)])

filename=sprintf('%s_%d_%s_%d.fig', 'corrNCell', NCell,'NShuffle',NShuffle);
saveas(gcf,filename)

figure
subplot(221)

errorbar(distanceOnlyI(idxI),corrIMeanMean(idxI),corrIMeanSEM(idxI),'g')
hold on
errorbar(distanceOnlyNI(idxNI),corrNIMeanMean(idxNI),corrNIMeanSEM(idxNI),'m')

%STATs
ITemp=corrIMeanAll(idxI);
NITemp=corrNIMeanAll(idxNI);
I=[];
NI=[];

for n=1:length(idxI);
I(:,n)=ITemp{n}';
NI(:,n)=NITemp{n}';
end

 [pAnova,pMC,pLabel] = anovaRM2W_full_BH(I,NI,1);
title(['corr mean pAnova',num2str(pAnova(1))]);


subplot(222)

errorbar(distanceOnlyI(idxI),corrIPeakMean(idxI),corrIPeakSEM(idxI),'g')
hold on
errorbar(distanceOnlyNI(idxNI),corrNIPeakMean(idxNI),corrNIPeakSEM(idxNI),'m')

%STATs
ITemp=corrIPeakAll(idxI);
NITemp=corrNIPeakAll(idxNI);
I=[];
NI=[];

for n=1:length(idxI);
I(:,n)=ITemp{n}';
NI(:,n)=NITemp{n}';
end

 [pAnova,pMC,pLabel] = anovaRM2W_full_BH(I,NI,1);
title(['corr peak pAnova',num2str(pAnova(1))]);

%no distances, just include all
I=cell2mat(corrIMeanAll(idxI));
NI=cell2mat(corrNIMeanAll(idxNI));
M=[];
M(1)=nanmean(I);
M(2)=nanmean(NI);
S=[];
S(1)=nansem(I,2);
S(2)=nansem(NI,2);
subplot(223)
bar([1 2],M)
hold on
errorbar([1 2],M,S,'.')
names={'Iden'; 'Noniden' };
set(gca,'xticklabel',names)
[r,p1]=ttest2(I,NI);
title(['mean p=',num2str(p1)])

%no distances, just include all
I=cell2mat(corrIPeakAll(idxI));
NI=cell2mat(corrNIPeakAll(idxNI));
M=[];
M(1)=nanmean(I);
M(2)=nanmean(NI);
S=[];
S(1)=nansem(I,2);
S(2)=nansem(NI,2);
subplot(224)
bar([1 2],M)
hold on
errorbar([1 2],M,S,'.')
names={'Iden'; 'Noniden' };
set(gca,'xticklabel',names)
[r,p1]=ttest2(I,NI);
title(['Peak p=',num2str(p1)])

filename=sprintf('%s_%d_%s_%d_%s.fig', 'corrNCell', NCell,'NShuffle',NShuffle,'matchedDistance');
saveas(gcf,filename)

%% calculate correlation
load('useIdx.mat');
load('useFolders.mat')
load('allDistancesIGroup.mat')
load('allDistancesNIGroup.mat')
p=pwd;

cueCellDataThresh=95;
% % number of cells per sequence
% NCell=15;
% % number of shuffles
% NShuffle=100;  

[corrIMeanNoShuffle,corrNIMeanNoShuffle,corrIPeakNoShuffle,corrNIPeakNoShuffle] = corrAtCuesNoShuffle(useIdx,useFolders,allDistancesIGroup,allDistancesNIGroup,cueCellDataThresh);

save('corrIMeanNoShuffle.mat','corrIMeanNoShuffle');
save('corrIPeakNoShuffle.mat','corrIPeakNoShuffle');
save('corrNIMeanNoShuffle.mat','corrNIMeanNoShuffle');
save('corrNIPeakNoShuffle.mat','corrNIPeakNoShuffle');


%% plot corr
corrIMeanNoShuffleAll={};% if there are two cells, merge them
corrIMeanNoShuffleMean=[];%mean
corrIMeanNoShuffleSEM=[];
for n=1:length(corrIMeanNoShuffle);

                    a=corrIMeanNoShuffle{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
    
        corrIMeanNoShuffleAll{n}=aa;
        corrIMeanNoShuffleMean(n)=nanmean(aa);
        corrIMeanNoShuffleSEM(n)=nansem(aa,2);

end

corrIPeakNoShuffleAll={};% if there are two cells, merge them
corrIPeakNoShuffleMean=[];%mean
corrIPeakNoShuffleSEM=[];
for n=1:length(corrIPeakNoShuffle);

                        a=corrIPeakNoShuffle{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
    
        corrIPeakNoShuffleAll{n}=aa;
        corrIPeakNoShuffleMean(n)=nanmean(aa);
        corrIPeakNoShuffleSEM(n)=nansem(aa,2);

end

distanceOnlyI=unique(allDistancesI(:,end));

corrNIMeanNoShuffleAll={};% if there are two cells, merge them
corrNIMeanNoShuffleMean=[];%mean
corrNIMeanNoShuffleSEM=[];
for n=1:length(corrNIMeanNoShuffle);

    a=corrNIMeanNoShuffle{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
    
        corrNIMeanNoShuffleAll{n}=aa;
        corrNIMeanNoShuffleMean(n)=nanmean(aa);
        corrNIMeanNoShuffleSEM(n)=nansem(aa,2);

end

corrNIPeakNoShuffleAll={};% if there are two cells, merge them
corrNIPeakNoShuffleMean=[];%mean
corrNIPeakNoShuffleSEM=[];
for n=1:length(corrNIPeakNoShuffle);

      a=corrNIPeakNoShuffle{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
    
    
        corrNIPeakNoShuffleAll{n}=aa;
        corrNIPeakNoShuffleMean(n)=nanmean(aa);
        corrNIPeakNoShuffleSEM(n)=nansem(aa,2);

end
distanceOnlyNI=unique(allDistancesNI(:,end));

figure
subplot(221)

errorbar(distanceOnlyI,corrIMeanNoShuffleMean,corrIMeanNoShuffleSEM,'g')
hold on
errorbar(distanceOnlyNI,corrNIMeanNoShuffleMean,corrNIMeanNoShuffleSEM,'m')
title('corr mean');

subplot(222)

errorbar(distanceOnlyI,corrIPeakNoShuffleMean,corrIPeakNoShuffleSEM,'g')
hold on
errorbar(distanceOnlyNI,corrNIPeakNoShuffleMean,corrNIPeakNoShuffleSEM,'m')
title('corr peak');

%no distances, just include all
I=cell2mat(corrIMeanNoShuffleAll);
NI=cell2mat(corrNIMeanNoShuffleAll);
M=[];
M(1)=nanmean(I);
M(2)=nanmean(NI);
S=[];
S(1)=nansem(I,2);
S(2)=nansem(NI,2);
subplot(223)
bar([1 2],M)
hold on
errorbar([1 2],M,S,'.')
names={'Iden'; 'Noniden' };
set(gca,'xticklabel',names)
[r,p1]=ttest2(I,NI);
title(['mean p=',num2str(p1)])

%no distances, just include all
I=cell2mat(corrIPeakNoShuffleAll);
NI=cell2mat(corrNIPeakNoShuffleAll);
M=[];
M(1)=nanmean(I);
M(2)=nanmean(NI);
S=[];
S(1)=nansem(I,2);
S(2)=nansem(NI,2);
subplot(224)
bar([1 2],M)
hold on
errorbar([1 2],M,S,'.')
names={'Iden'; 'Noniden' };
set(gca,'xticklabel',names)
[r,p1]=ttest2(I,NI);
title(['Peak p=',num2str(p1)])

saveas(gcf,'corrNCellNoShuffle.fig')

figure
subplot(221)

errorbar(distanceOnlyI(idxI),corrIMeanNoShuffleMean(idxI),corrIMeanNoShuffleSEM(idxI),'g')
hold on
errorbar(distanceOnlyNI(idxNI),corrNIMeanNoShuffleMean(idxNI),corrNIMeanNoShuffleSEM(idxNI),'m')

%STATs
ITemp=corrIMeanNoShuffleAll(idxI);
NITemp=corrNIMeanNoShuffleAll(idxNI);
I=[];
NI=[];

for n=1:length(idxI);
I(:,n)=ITemp{n}';
NI(:,n)=NITemp{n}';
end

 [pAnova,pMC,pLabel] = anovaRM2W_full_BH(I,NI,1);
title(['corr mean pAnova',num2str(pAnova(1))]);


subplot(222)

errorbar(distanceOnlyI(idxI),corrIPeakNoShuffleMean(idxI),corrIPeakNoShuffleSEM(idxI),'g')
hold on
errorbar(distanceOnlyNI(idxNI),corrNIPeakNoShuffleMean(idxNI),corrNIPeakNoShuffleSEM(idxNI),'m')

%STATs
ITemp=corrIPeakNoShuffleAll(idxI);
NITemp=corrNIPeakNoShuffleAll(idxNI);
I=[];
NI=[];

for n=1:length(idxI);
I(:,n)=ITemp{n}';
NI(:,n)=NITemp{n}';
end

 [pAnova,pMC,pLabel] = anovaRM2W_full_BH(I,NI,1);
title(['corr mean pAnova',num2str(pAnova(1))]);

%no distances, just include all
I=cell2mat(corrIMeanNoShuffleAll(idxI));
NI=cell2mat(corrNIMeanNoShuffleAll(idxNI));
M=[];
M(1)=nanmean(I);
M(2)=nanmean(NI);
S=[];
S(1)=nansem(I,2);
S(2)=nansem(NI,2);
subplot(223)
bar([1 2],M)
hold on
errorbar([1 2],M,S,'.')
names={'Iden'; 'Noniden' };
set(gca,'xticklabel',names)
[r,p1]=ttest2(I,NI);
title(['mean p=',num2str(p1)])

%no distances, just include all
I=cell2mat(corrIPeakNoShuffleAll(idxI));
NI=cell2mat(corrNIPeakNoShuffleAll(idxNI));
M=[];
M(1)=nanmean(I);
M(2)=nanmean(NI);
S=[];
S(1)=nansem(I,2);
S(2)=nansem(NI,2);
subplot(224)
bar([1 2],M)
hold on
errorbar([1 2],M,S,'.')
names={'Iden'; 'Noniden' };
set(gca,'xticklabel',names)
[r,p1]=ttest2(I,NI);
title(['Peak p=',num2str(p1)])


saveas(gcf,'corrNCellNoShuffle_matchedDistance.fig')






