load('D:\GarretData\IdenticalCueData\tracks234\env2Day1_beforeAfterCueNew\ampDiffIMeanBefore.mat');
load('D:\GarretData\IdenticalCueData\tracks234\env2Day1_beforeAfterCueNew\ampDiffNIMeanBefore.mat');
load('D:\GarretData\IdenticalCueData\tracks234\env2Day1_beforeAfterCueNew\ampDiffIMeanAfter.mat');
load('D:\GarretData\IdenticalCueData\tracks234\env2Day1_beforeAfterCueNew\ampDiffNIMeanAfter.mat');
%only use matched distances
idxI=[1 3 5 6];
idxNI=[1 3 5 6];

ampDiffIMeanAllBefore={};% if there are two cells, merge them
for n=1:length(ampDiffIMeanBefore);
    a=ampDiffIMeanBefore{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        ampDiffIMeanAllBefore{n}=aa;
end
ampDiffIMeanAllMatchBefore1=ampDiffIMeanAllBefore(idxI);

ampDiffIMeanAllAfter={};% if there are two cells, merge them
for n=1:length(ampDiffIMeanAfter);
    a=ampDiffIMeanAfter{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        ampDiffIMeanAllAfter{n}=aa;
end
ampDiffIMeanAllMatchAfter1=ampDiffIMeanAllAfter(idxI);

ampDiffNIMeanAllBefore={};% if there are two cells, merge them
for n=1:length(ampDiffNIMeanBefore);
        a=ampDiffNIMeanBefore{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        ampDiffNIMeanAllBefore{n}=aa;
end
ampDiffNIMeanAllMatchBefore1=ampDiffNIMeanAllBefore(idxNI);

ampDiffNIMeanAllAfter={};% if there are two cells, merge them
for n=1:length(ampDiffNIMeanAfter);
        a=ampDiffNIMeanAfter{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        ampDiffNIMeanAllAfter{n}=aa;
end
ampDiffNIMeanAllMatchAfter1=ampDiffNIMeanAllAfter(idxNI);

%%
load('D:\GarretData\IdenticalCueData\tracks234\env3Day1_beforeAfterCueNew\ampDiffIMeanBefore.mat');
load('D:\GarretData\IdenticalCueData\tracks234\env3Day1_beforeAfterCueNew\ampDiffNIMeanBefore.mat');
load('D:\GarretData\IdenticalCueData\tracks234\env3Day1_beforeAfterCueNew\ampDiffIMeanAfter.mat');
load('D:\GarretData\IdenticalCueData\tracks234\env3Day1_beforeAfterCueNew\ampDiffNIMeanAfter.mat');
%only use matched distances
idxI=[1 3 5 6];
idxNI=[1 3 5 6];

ampDiffIMeanAllBefore={};% if there are two cells, merge them
for n=1:length(ampDiffIMeanBefore);
    a=ampDiffIMeanBefore{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        ampDiffIMeanAllBefore{n}=aa;
end
ampDiffIMeanAllMatchBefore2=ampDiffIMeanAllBefore(idxI);

ampDiffIMeanAllAfter={};% if there are two cells, merge them
for n=1:length(ampDiffIMeanAfter);
    a=ampDiffIMeanAfter{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        ampDiffIMeanAllAfter{n}=aa;
end
ampDiffIMeanAllMatchAfter2=ampDiffIMeanAllAfter(idxI);

ampDiffNIMeanAllBefore={};% if there are two cells, merge them
for n=1:length(ampDiffNIMeanBefore);
        a=ampDiffNIMeanBefore{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        ampDiffNIMeanAllBefore{n}=aa;
end
ampDiffNIMeanAllMatchBefore2=ampDiffNIMeanAllBefore(idxNI);

ampDiffNIMeanAllAfter={};% if there are two cells, merge them
for n=1:length(ampDiffNIMeanAfter);
        a=ampDiffNIMeanAfter{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        ampDiffNIMeanAllAfter{n}=aa;
end
ampDiffNIMeanAllMatchAfter2=ampDiffNIMeanAllAfter(idxNI);


%%
load('D:\GarretData\IdenticalCueData\tracks234\env4Day1_beforeAfterCueNew\ampDiffIMeanBefore.mat');
load('D:\GarretData\IdenticalCueData\tracks234\env4Day1_beforeAfterCueNew\ampDiffNIMeanBefore.mat');
load('D:\GarretData\IdenticalCueData\tracks234\env4Day1_beforeAfterCueNew\ampDiffIMeanAfter.mat');
load('D:\GarretData\IdenticalCueData\tracks234\env4Day1_beforeAfterCueNew\ampDiffNIMeanAfter.mat');
%only use matched distances
idxI=[1 2 3 4];
idxNI=[1 3 4 5];

ampDiffIMeanAllBefore={};% if there are two cells, merge them
for n=1:length(ampDiffIMeanBefore);
    a=ampDiffIMeanBefore{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        ampDiffIMeanAllBefore{n}=aa;
end
ampDiffIMeanAllMatchBefore3=ampDiffIMeanAllBefore(idxI);

ampDiffIMeanAllAfter={};% if there are two cells, merge them
for n=1:length(ampDiffIMeanAfter);
    a=ampDiffIMeanAfter{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        ampDiffIMeanAllAfter{n}=aa;
end
ampDiffIMeanAllMatchAfter3=ampDiffIMeanAllAfter(idxI);

ampDiffNIMeanAllBefore={};% if there are two cells, merge them
for n=1:length(ampDiffNIMeanBefore);
        a=ampDiffNIMeanBefore{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        ampDiffNIMeanAllBefore{n}=aa;
end
ampDiffNIMeanAllMatchBefore3=ampDiffNIMeanAllBefore(idxNI);

ampDiffNIMeanAllAfter={};% if there are two cells, merge them
for n=1:length(ampDiffNIMeanAfter);
        a=ampDiffNIMeanAfter{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        ampDiffNIMeanAllAfter{n}=aa;
end
ampDiffNIMeanAllMatchAfter3=ampDiffNIMeanAllAfter(idxNI);

%%

ampDiffIBefore={};
ampDiffNIBefore={};
ampDiffIAfter={};
ampDiffNIAfter={};

for n=1:4;
    ampDiffIBefore{n}=[];
    ampDiffNIBefore{n}=[];
    ampDiffIAfter{n}=[];
    ampDiffNIAfter{n}=[];
    ampDiffIBefore{n}=[ampDiffIBefore{n} ampDiffIMeanAllMatchBefore1{n} ampDiffIMeanAllMatchBefore2{n} ampDiffIMeanAllMatchBefore3{n}]';
    ampDiffNIBefore{n}=[ampDiffNIBefore{n} ampDiffNIMeanAllMatchBefore1{n} ampDiffNIMeanAllMatchBefore2{n} ampDiffNIMeanAllMatchBefore3{n}]';
    ampDiffIAfter{n}=[ampDiffIAfter{n} ampDiffIMeanAllMatchAfter1{n} ampDiffIMeanAllMatchAfter2{n} ampDiffIMeanAllMatchAfter3{n}]';
    ampDiffNIAfter{n}=[ampDiffNIAfter{n} ampDiffNIMeanAllMatchAfter1{n} ampDiffNIMeanAllMatchAfter2{n} ampDiffNIMeanAllMatchAfter3{n}]';
end
ampDiffIBefore=cell2mat(ampDiffIBefore);
ampDiffNIBefore=cell2mat(ampDiffNIBefore);
ampDiffIAfter=cell2mat(ampDiffIAfter);
ampDiffNIAfter=cell2mat(ampDiffNIAfter);



ampDiffIBeforeMean=[];%mean
ampDiffIBeforeSEM=[];
ampDiffNIBeforeMean=[];%mean
ampDiffNIBeforeSEM=[];


    ampDiffIBeforeMean=nanmean(ampDiffIBefore,1);
    ampDiffIBeforeSEM=nansem(ampDiffIBefore,1);
    ampDiffNIBeforeMean=nanmean(ampDiffNIBefore,1);
    ampDiffNIBeforeSEM=nansem(ampDiffNIBefore,1);

    ampDiffIAfterMean=[];%mean
ampDiffIAfterSEM=[];
ampDiffNIAfterMean=[];%mean
ampDiffNIAfterSEM=[];


    ampDiffIAfterMean=nanmean(ampDiffIAfter,1);
    ampDiffIAfterSEM=nansem(ampDiffIAfter,1);
    ampDiffNIAfterMean=nanmean(ampDiffNIAfter,1);
    ampDiffNIAfterSEM=nansem(ampDiffNIAfter,1);

distances=[100 275 450 550];

 [pAnova,pMC,pLabel] = anovaRM2W_full_BH(ampDiffIBefore,ampDiffIAfter,1);
[pAnova1,pMC,pLabel] = anovaRM2W_full_BH(ampDiffNIBefore,ampDiffNIAfter,1);

figure
subplot(121)
errorbar(distances,ampDiffIBeforeMean,ampDiffIBeforeSEM,'g')
hold on
errorbar(distances,ampDiffNIBeforeMean,ampDiffNIBeforeSEM,'m')

errorbar(distances,ampDiffIAfterMean,ampDiffIAfterSEM,'g--')
hold on
errorbar(distances,ampDiffNIAfterMean,ampDiffNIAfterSEM,'m--')

title(['ampDiff mean p=',num2str([pAnova(1) pAnova1(1)])]);
xlim([0 600])

subplot(122)

ib=reshape(ampDiffIBefore,[size(ampDiffIBefore,1)*size(ampDiffIBefore,2) 1]);
ia=reshape(ampDiffIAfter,[size(ampDiffIAfter,1)*size(ampDiffIAfter,2) 1]);
nib=reshape(ampDiffNIBefore,[size(ampDiffNIBefore,1)*size(ampDiffNIBefore,2) 1]);
nia=reshape(ampDiffNIAfter,[size(ampDiffNIAfter,1)*size(ampDiffNIAfter,2) 1]);

c={};
c{1}='abefore';%identical before. Name them like this because the violin plot code always sort then based on the first letter but I want to put before first
c{2}='bafter';%identical after
c{3}='nabefore';%non-identical before
c{4}='nbafter';%non-identical after
color=[0 1 0;0 1 0;1 0 1;1 0 1];

%data
All=[];
for n=1:size(ib,2);
    All=[All;ib(:,n)];
end
for n=1:size(ia,2);
    All=[All;ia(:,n)];
end
for n=1:size(nib,2);
    All=[All;nib(:,n)];
end
for n=1:size(nia,2);
    All=[All;nia(:,n)];
end

%category
AllC={};
for n=1,
    AllC=[AllC;repmat(c(n),size(ib,1),1)];
end
for n=2,
    AllC=[AllC;repmat(c(n),size(ia,1),1)];
end
for n=3,
    AllC=[AllC;repmat(c(n),size(nib,1),1)];
end
for n=4,
    AllC=[AllC;repmat(c(n),size(nia,1),1)];
end

subplot(122)
violinplot(All, AllC,'ShowData',false,'ViolinColor',color,'ShowMean',true,'ShowWhiskers',false,'ShowBox',false);
xlim tight;
pbaspect([1 1 1])
[~,p] = ttest2(ia, ib);
[~,p1] = ttest2(nia, nib);
title([num2str([p p1])])


saveas(gcf,'ampDifferencesMatchedDistance.fig')
print -painters -depsc ampDifferencesMatchedDistance.eps

%% put all distances together

load('D:\GarretData\IdenticalCueData\tracks234\env2Day1_beforeAfterCueNew\ampDiffIMeanBefore.mat');
load('D:\GarretData\IdenticalCueData\tracks234\env2Day1_beforeAfterCueNew\ampDiffNIMeanBefore.mat');
load('D:\GarretData\IdenticalCueData\tracks234\env2Day1_beforeAfterCueNew\ampDiffIMeanAfter.mat');
load('D:\GarretData\IdenticalCueData\tracks234\env2Day1_beforeAfterCueNew\ampDiffNIMeanAfter.mat');
%use all distances


ampDiffIMeanAllBefore={};% if there are two cells, merge them
for n=1:length(ampDiffIMeanBefore);
    a=ampDiffIMeanBefore{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        ampDiffIMeanAllBefore{n}=aa;
end

ampDiffIMeanAllAfter={};% if there are two cells, merge them
for n=1:length(ampDiffIMeanAfter);
    a=ampDiffIMeanAfter{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        ampDiffIMeanAllAfter{n}=aa;
end

ampDiffNIMeanAllBefore={};% if there are two cells, merge them
for n=1:length(ampDiffNIMeanBefore);
        a=ampDiffNIMeanBefore{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        ampDiffNIMeanAllBefore{n}=aa;
end

ampDiffNIMeanAllAfter={};% if there are two cells, merge them
for n=1:length(ampDiffNIMeanAfter);
        a=ampDiffNIMeanAfter{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        ampDiffNIMeanAllAfter{n}=aa;
end

allIBefore=ampDiffIMeanAllBefore;
allIAfter=ampDiffIMeanAllAfter;
allNIBefore=ampDiffNIMeanAllBefore;
allNIAfter=ampDiffNIMeanAllAfter;

%% env3

load('D:\GarretData\IdenticalCueData\tracks234\env3Day1_beforeAfterCueNew\ampDiffIMeanBefore.mat');
load('D:\GarretData\IdenticalCueData\tracks234\env3Day1_beforeAfterCueNew\ampDiffNIMeanBefore.mat');
load('D:\GarretData\IdenticalCueData\tracks234\env3Day1_beforeAfterCueNew\ampDiffIMeanAfter.mat');
load('D:\GarretData\IdenticalCueData\tracks234\env3Day1_beforeAfterCueNew\ampDiffNIMeanAfter.mat');
%use all distances


ampDiffIMeanAllBefore={};% if there are two cells, merge them
for n=1:length(ampDiffIMeanBefore);
    a=ampDiffIMeanBefore{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        ampDiffIMeanAllBefore{n}=aa;
end

ampDiffIMeanAllAfter={};% if there are two cells, merge them
for n=1:length(ampDiffIMeanAfter);
    a=ampDiffIMeanAfter{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        ampDiffIMeanAllAfter{n}=aa;
end

ampDiffNIMeanAllBefore={};% if there are two cells, merge them
for n=1:length(ampDiffNIMeanBefore);
        a=ampDiffNIMeanBefore{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        ampDiffNIMeanAllBefore{n}=aa;
end

ampDiffNIMeanAllAfter={};% if there are two cells, merge them
for n=1:length(ampDiffNIMeanAfter);
        a=ampDiffNIMeanAfter{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        ampDiffNIMeanAllAfter{n}=aa;
end


for n=1:length(allIBefore);
    allIBefore{n}=[allIBefore{n} ampDiffIMeanAllBefore{n}];
end
for n=1:length(allIAfter);
    allIAfter{n}=[allIAfter{n} ampDiffIMeanAllAfter{n}];
end

for n=1:length(allNIBefore);
    allNIBefore{n}=[allNIBefore{n} ampDiffNIMeanAllBefore{n}];
end
for n=1:length(allIAfter);
    allNIAfter{n}=[allNIAfter{n} ampDiffNIMeanAllAfter{n}];
end


%all distances are the same as above
% 
% I: 100 200. 275. 350, 450, 550
% NI: 100, 175, 275, 375, 450, 550, 650
    %% env4
load('D:\GarretData\IdenticalCueData\tracks234\env4Day1_beforeAfterCueNew\ampDiffIMeanBefore.mat');
load('D:\GarretData\IdenticalCueData\tracks234\env4Day1_beforeAfterCueNew\ampDiffNIMeanBefore.mat');
load('D:\GarretData\IdenticalCueData\tracks234\env4Day1_beforeAfterCueNew\ampDiffIMeanAfter.mat');
load('D:\GarretData\IdenticalCueData\tracks234\env4Day1_beforeAfterCueNew\ampDiffNIMeanAfter.mat');
%use all distances

ampDiffIMeanAllBefore={};% if there are two cells, merge them
for n=1:length(ampDiffIMeanBefore);
    a=ampDiffIMeanBefore{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        ampDiffIMeanAllBefore{n}=aa;
end

ampDiffIMeanAllAfter={};% if there are two cells, merge them
for n=1:length(ampDiffIMeanAfter);
    a=ampDiffIMeanAfter{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        ampDiffIMeanAllAfter{n}=aa;
end

ampDiffNIMeanAllBefore={};% if there are two cells, merge them
for n=1:length(ampDiffNIMeanBefore);
        a=ampDiffNIMeanBefore{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        ampDiffNIMeanAllBefore{n}=aa;
end

ampDiffNIMeanAllAfter={};% if there are two cells, merge them
for n=1:length(ampDiffNIMeanAfter);
        a=ampDiffNIMeanAfter{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        ampDiffNIMeanAllAfter{n}=aa;
end


allIBefore{1}=[allIBefore{1} ampDiffIMeanAllBefore{1}];%100
allIBefore{2}=allIBefore{2};%200  
allIBefore{3}=[allIBefore{3} ampDiffIMeanAllBefore{2}];%275   
allIBefore{4}=allIBefore{4};%350  
allIBefore{5}=[allIBefore{5} ampDiffIMeanAllBefore{3}]; %450 
allIBefore{6}=[allIBefore{6} ampDiffIMeanAllBefore{4}]; %550
allIBefore{7}=ampDiffIMeanAllBefore{5};%725
allIBefore{8}=ampDiffIMeanAllBefore{6};%825

allIAfter{1}=[allIAfter{1} ampDiffIMeanAllAfter{1}];%100
allIAfter{2}=allIAfter{2};%200  
allIAfter{3}=[allIAfter{3} ampDiffIMeanAllAfter{2}];%275   
allIAfter{4}=allIAfter{4};%350  
allIAfter{5}=[allIAfter{5} ampDiffIMeanAllAfter{3}]; %450 
allIAfter{6}=[allIAfter{6} ampDiffIMeanAllAfter{4}]; %550
allIAfter{7}=ampDiffIMeanAllAfter{5};%725
allIAfter{8}=ampDiffIMeanAllAfter{6};%825

allNIBefore{1}=[allNIBefore{1} ampDiffNIMeanAllBefore{1}];%100
allNIBefore{2}=[allNIBefore{2} ampDiffNIMeanAllBefore{2}]; %175
allNIBefore{3}=[allNIBefore{3} ampDiffNIMeanAllBefore{3}]; %275
allNIBefore{4}=allNIBefore{4};%375 
allNIBefore{5}=[allNIBefore{5} ampDiffNIMeanAllBefore{4}]; %450
allNIBefore{6}=[allNIBefore{6} ampDiffNIMeanAllBefore{5}]; %450
allNIBefore{8}=allNIBefore{7};%MOVE 7 TO 8:650
allNIBefore{7}=ampDiffNIMeanAllBefore{6};%625
allNIBefore{8}=allNIBefore{8};%650
allNIBefore{9}=ampDiffNIMeanAllBefore{7};%725

allNIAfter{1}=[allNIAfter{1} ampDiffNIMeanAllAfter{1}];%100
allNIAfter{2}=[allNIAfter{2} ampDiffNIMeanAllAfter{2}]; %175
allNIAfter{3}=[allNIAfter{3} ampDiffNIMeanAllAfter{3}]; %275
allNIAfter{4}=allNIAfter{4};%375 
allNIAfter{5}=[allNIAfter{5} ampDiffNIMeanAllAfter{4}]; %450
allNIAfter{6}=[allNIAfter{6} ampDiffNIMeanAllAfter{5}]; %450
allNIAfter{8}=allNIAfter{7};%MOVE 7 TO 8:650
allNIAfter{7}=ampDiffNIMeanAllAfter{6};%625
allNIAfter{8}=allNIAfter{8};%650
allNIAfter{9}=ampDiffNIMeanAllAfter{7};%725
%%
distancesI=[100 200 275 350 450 550 725 825];
distancesNI=[100 175 275 375 450 550 625 650 725];
MIBefore=[];
EIBefore=[];
for n=1:length(allIBefore);
    MIBefore(n)=nanmean(allIBefore{n});
     EIBefore(n)=nansem(allIBefore{n},2);
end

MNIBefore=[];
ENIBefore=[];
for n=1:length(allNIBefore);
    MNIBefore(n)=nanmean(allNIBefore{n});
     ENIBefore(n)=nansem(allNIBefore{n},2);
end

MIAfter=[];
EIAfter=[];
for n=1:length(allIAfter);
    MIAfter(n)=nanmean(allIAfter{n});
     EIAfter(n)=nansem(allIAfter{n},2);
end

MNIAfter=[];
ENIAfter=[];
for n=1:length(allNIAfter);
    MNIAfter(n)=nanmean(allNIAfter{n});
     ENIAfter(n)=nansem(allNIAfter{n},2);
end

figure
subplot(121)
errorbar(distancesI,MIBefore,EIBefore,'g')
hold on
errorbar(distancesNI,MNIBefore,ENIBefore,'m')
hold on
errorbar(distancesI,MIAfter,EIAfter,'g--')
hold on
errorbar(distancesNI,MNIAfter,ENIAfter,'m--')

title(['ampDifferences ALL']);
xlim([0 900])

%%
subplot(122)
ib=cell2mat(allIBefore)';
ia=cell2mat(allIAfter)';
nib=cell2mat(allNIBefore)';
nia=cell2mat(allNIAfter)';

c={};
c{1}='abefore';%identical before. Name them like this because the violin plot code always sort then based on the first letter but I want to put before first
c{2}='bafter';%identical after
c{3}='nabefore';%non-identical before
c{4}='nbafter';%non-identical after
color=[0 1 0;0 1 0;1 0 1;1 0 1];

%data
All=[];
for n=1:size(ib,2);
    All=[All;ib(:,n)];
end
for n=1:size(ia,2);
    All=[All;ia(:,n)];
end
for n=1:size(nib,2);
    All=[All;nib(:,n)];
end
for n=1:size(nia,2);
    All=[All;nia(:,n)];
end

%category
AllC={};
for n=1,
    AllC=[AllC;repmat(c(n),size(ib,1),1)];
end
for n=2,
    AllC=[AllC;repmat(c(n),size(ia,1),1)];
end
for n=3,
    AllC=[AllC;repmat(c(n),size(nib,1),1)];
end
for n=4,
    AllC=[AllC;repmat(c(n),size(nia,1),1)];
end

subplot(122)
violinplot(All, AllC,'ShowData',false,'ViolinColor',color,'ShowMean',true,'ShowWhiskers',false,'ShowBox',false);
xlim tight;
pbaspect([1 1 1])
[~,p] = ttest2(ia, ib);
[~,p1] = ttest2(nia, nib);
title([num2str([p p1])])

saveas(gcf,'ampDifferencesAllDistance.fig')
print -painters -depsc ampDifferencesAllDistance.eps

