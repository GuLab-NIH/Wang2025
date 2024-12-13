load('D:\GarretData\IdenticalCueData\tracks234\env2Day1_beforeAfterCueNew\corrIMeanBefore.mat');
load('D:\GarretData\IdenticalCueData\tracks234\env2Day1_beforeAfterCueNew\corrNIMeanBefore.mat');
load('D:\GarretData\IdenticalCueData\tracks234\env2Day1_beforeAfterCueNew\corrIMeanAfter.mat');
load('D:\GarretData\IdenticalCueData\tracks234\env2Day1_beforeAfterCueNew\corrNIMeanAfter.mat');
%only use matched distances
idxI=[1 3 5 6];
idxNI=[1 3 5 6];

corrIMeanAllBefore={};% if there are two cells, merge them
for n=1:length(corrIMeanBefore);
    a=corrIMeanBefore{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        corrIMeanAllBefore{n}=aa;
end
corrIMeanAllMatchBefore1=corrIMeanAllBefore(idxI);

corrIMeanAllAfter={};% if there are two cells, merge them
for n=1:length(corrIMeanAfter);
    a=corrIMeanAfter{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        corrIMeanAllAfter{n}=aa;
end
corrIMeanAllMatchAfter1=corrIMeanAllAfter(idxI);

corrNIMeanAllBefore={};% if there are two cells, merge them
for n=1:length(corrNIMeanBefore);
        a=corrNIMeanBefore{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        corrNIMeanAllBefore{n}=aa;
end
corrNIMeanAllMatchBefore1=corrNIMeanAllBefore(idxNI);

corrNIMeanAllAfter={};% if there are two cells, merge them
for n=1:length(corrNIMeanAfter);
        a=corrNIMeanAfter{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        corrNIMeanAllAfter{n}=aa;
end
corrNIMeanAllMatchAfter1=corrNIMeanAllAfter(idxNI);

%%
load('D:\GarretData\IdenticalCueData\tracks234\env3Day1_beforeAfterCueNew\corrIMeanBefore.mat');
load('D:\GarretData\IdenticalCueData\tracks234\env3Day1_beforeAfterCueNew\corrNIMeanBefore.mat');
load('D:\GarretData\IdenticalCueData\tracks234\env3Day1_beforeAfterCueNew\corrIMeanAfter.mat');
load('D:\GarretData\IdenticalCueData\tracks234\env3Day1_beforeAfterCueNew\corrNIMeanAfter.mat');
%only use matched distances
idxI=[1 3 5 6];
idxNI=[1 3 5 6];

corrIMeanAllBefore={};% if there are two cells, merge them
for n=1:length(corrIMeanBefore);
    a=corrIMeanBefore{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        corrIMeanAllBefore{n}=aa;
end
corrIMeanAllMatchBefore2=corrIMeanAllBefore(idxI);

corrIMeanAllAfter={};% if there are two cells, merge them
for n=1:length(corrIMeanAfter);
    a=corrIMeanAfter{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        corrIMeanAllAfter{n}=aa;
end
corrIMeanAllMatchAfter2=corrIMeanAllAfter(idxI);

corrNIMeanAllBefore={};% if there are two cells, merge them
for n=1:length(corrNIMeanBefore);
        a=corrNIMeanBefore{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        corrNIMeanAllBefore{n}=aa;
end
corrNIMeanAllMatchBefore2=corrNIMeanAllBefore(idxNI);

corrNIMeanAllAfter={};% if there are two cells, merge them
for n=1:length(corrNIMeanAfter);
        a=corrNIMeanAfter{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        corrNIMeanAllAfter{n}=aa;
end
corrNIMeanAllMatchAfter2=corrNIMeanAllAfter(idxNI);


%%
load('D:\GarretData\IdenticalCueData\tracks234\env4Day1_beforeAfterCueNew\corrIMeanBefore.mat');
load('D:\GarretData\IdenticalCueData\tracks234\env4Day1_beforeAfterCueNew\corrNIMeanBefore.mat');
load('D:\GarretData\IdenticalCueData\tracks234\env4Day1_beforeAfterCueNew\corrIMeanAfter.mat');
load('D:\GarretData\IdenticalCueData\tracks234\env4Day1_beforeAfterCueNew\corrNIMeanAfter.mat');
%only use matched distances
idxI=[1 2 3 4];
idxNI=[1 3 4 5];

corrIMeanAllBefore={};% if there are two cells, merge them
for n=1:length(corrIMeanBefore);
    a=corrIMeanBefore{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        corrIMeanAllBefore{n}=aa;
end
corrIMeanAllMatchBefore3=corrIMeanAllBefore(idxI);

corrIMeanAllAfter={};% if there are two cells, merge them
for n=1:length(corrIMeanAfter);
    a=corrIMeanAfter{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        corrIMeanAllAfter{n}=aa;
end
corrIMeanAllMatchAfter3=corrIMeanAllAfter(idxI);

corrNIMeanAllBefore={};% if there are two cells, merge them
for n=1:length(corrNIMeanBefore);
        a=corrNIMeanBefore{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        corrNIMeanAllBefore{n}=aa;
end
corrNIMeanAllMatchBefore3=corrNIMeanAllBefore(idxNI);

corrNIMeanAllAfter={};% if there are two cells, merge them
for n=1:length(corrNIMeanAfter);
        a=corrNIMeanAfter{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        corrNIMeanAllAfter{n}=aa;
end
corrNIMeanAllMatchAfter3=corrNIMeanAllAfter(idxNI);

%%

corrIBefore={};
corrNIBefore={};
corrIAfter={};
corrNIAfter={};

for n=1:4;
    corrIBefore{n}=[];
    corrNIBefore{n}=[];
    corrIAfter{n}=[];
    corrNIAfter{n}=[];
    corrIBefore{n}=[corrIBefore{n} corrIMeanAllMatchBefore1{n} corrIMeanAllMatchBefore2{n} corrIMeanAllMatchBefore3{n}]';
    corrNIBefore{n}=[corrNIBefore{n} corrNIMeanAllMatchBefore1{n} corrNIMeanAllMatchBefore2{n} corrNIMeanAllMatchBefore3{n}]';
    corrIAfter{n}=[corrIAfter{n} corrIMeanAllMatchAfter1{n} corrIMeanAllMatchAfter2{n} corrIMeanAllMatchAfter3{n}]';
    corrNIAfter{n}=[corrNIAfter{n} corrNIMeanAllMatchAfter1{n} corrNIMeanAllMatchAfter2{n} corrNIMeanAllMatchAfter3{n}]';
end
corrIBefore=cell2mat(corrIBefore);
corrNIBefore=cell2mat(corrNIBefore);
corrIAfter=cell2mat(corrIAfter);
corrNIAfter=cell2mat(corrNIAfter);



corrIBeforeMean=[];%mean
corrIBeforeSEM=[];
corrNIBeforeMean=[];%mean
corrNIBeforeSEM=[];


    corrIBeforeMean=nanmean(corrIBefore,1);
    corrIBeforeSEM=nansem(corrIBefore,1);
    corrNIBeforeMean=nanmean(corrNIBefore,1);
    corrNIBeforeSEM=nansem(corrNIBefore,1);

    corrIAfterMean=[];%mean
corrIAfterSEM=[];
corrNIAfterMean=[];%mean
corrNIAfterSEM=[];


    corrIAfterMean=nanmean(corrIAfter,1);
    corrIAfterSEM=nansem(corrIAfter,1);
    corrNIAfterMean=nanmean(corrNIAfter,1);
    corrNIAfterSEM=nansem(corrNIAfter,1);

distances=[100 275 450 550];

 [pAnova,pMC,pLabel] = anovaRM2W_full_BH(corrIBefore,corrIAfter,1);
[pAnova1,pMC,pLabel] = anovaRM2W_full_BH(corrNIBefore,corrNIAfter,1);

figure
subplot(121)
errorbar(distances,corrIBeforeMean,corrIBeforeSEM,'g')
hold on
errorbar(distances,corrNIBeforeMean,corrNIBeforeSEM,'m')

errorbar(distances,corrIAfterMean,corrIAfterSEM,'g--')
hold on
errorbar(distances,corrNIAfterMean,corrNIAfterSEM,'m--')

title(['corr mean p=',num2str([pAnova(1) pAnova1(1)])]);
xlim([0 600])

subplot(122)

ib=reshape(corrIBefore,[size(corrIBefore,1)*size(corrIBefore,2) 1]);
ia=reshape(corrIAfter,[size(corrIAfter,1)*size(corrIAfter,2) 1]);
nib=reshape(corrNIBefore,[size(corrNIBefore,1)*size(corrNIBefore,2) 1]);
nia=reshape(corrNIAfter,[size(corrNIAfter,1)*size(corrNIAfter,2) 1]);

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


saveas(gcf,'correrencesMatchedDistance.fig')
print -painters -depsc correrencesMatchedDistance.eps

%% put all distances together

load('D:\GarretData\IdenticalCueData\tracks234\env2Day1_beforeAfterCueNew\corrIMeanBefore.mat');
load('D:\GarretData\IdenticalCueData\tracks234\env2Day1_beforeAfterCueNew\corrNIMeanBefore.mat');
load('D:\GarretData\IdenticalCueData\tracks234\env2Day1_beforeAfterCueNew\corrIMeanAfter.mat');
load('D:\GarretData\IdenticalCueData\tracks234\env2Day1_beforeAfterCueNew\corrNIMeanAfter.mat');
%use all distances


corrIMeanAllBefore={};% if there are two cells, merge them
for n=1:length(corrIMeanBefore);
    a=corrIMeanBefore{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        corrIMeanAllBefore{n}=aa;
end

corrIMeanAllAfter={};% if there are two cells, merge them
for n=1:length(corrIMeanAfter);
    a=corrIMeanAfter{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        corrIMeanAllAfter{n}=aa;
end

corrNIMeanAllBefore={};% if there are two cells, merge them
for n=1:length(corrNIMeanBefore);
        a=corrNIMeanBefore{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        corrNIMeanAllBefore{n}=aa;
end

corrNIMeanAllAfter={};% if there are two cells, merge them
for n=1:length(corrNIMeanAfter);
        a=corrNIMeanAfter{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        corrNIMeanAllAfter{n}=aa;
end

allIBefore=corrIMeanAllBefore;
allIAfter=corrIMeanAllAfter;
allNIBefore=corrNIMeanAllBefore;
allNIAfter=corrNIMeanAllAfter;

%% env3

load('D:\GarretData\IdenticalCueData\tracks234\env3Day1_beforeAfterCueNew\corrIMeanBefore.mat');
load('D:\GarretData\IdenticalCueData\tracks234\env3Day1_beforeAfterCueNew\corrNIMeanBefore.mat');
load('D:\GarretData\IdenticalCueData\tracks234\env3Day1_beforeAfterCueNew\corrIMeanAfter.mat');
load('D:\GarretData\IdenticalCueData\tracks234\env3Day1_beforeAfterCueNew\corrNIMeanAfter.mat');
%use all distances


corrIMeanAllBefore={};% if there are two cells, merge them
for n=1:length(corrIMeanBefore);
    a=corrIMeanBefore{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        corrIMeanAllBefore{n}=aa;
end

corrIMeanAllAfter={};% if there are two cells, merge them
for n=1:length(corrIMeanAfter);
    a=corrIMeanAfter{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        corrIMeanAllAfter{n}=aa;
end

corrNIMeanAllBefore={};% if there are two cells, merge them
for n=1:length(corrNIMeanBefore);
        a=corrNIMeanBefore{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        corrNIMeanAllBefore{n}=aa;
end

corrNIMeanAllAfter={};% if there are two cells, merge them
for n=1:length(corrNIMeanAfter);
        a=corrNIMeanAfter{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        corrNIMeanAllAfter{n}=aa;
end


for n=1:length(allIBefore);
    allIBefore{n}=[allIBefore{n} corrIMeanAllBefore{n}];
end
for n=1:length(allIAfter);
    allIAfter{n}=[allIAfter{n} corrIMeanAllAfter{n}];
end

for n=1:length(allNIBefore);
    allNIBefore{n}=[allNIBefore{n} corrNIMeanAllBefore{n}];
end
for n=1:length(allIAfter);
    allNIAfter{n}=[allNIAfter{n} corrNIMeanAllAfter{n}];
end


%all distances are the same as above
% 
% I: 100 200. 275. 350, 450, 550
% NI: 100, 175, 275, 375, 450, 550, 650
    %% env4
load('D:\GarretData\IdenticalCueData\tracks234\env4Day1_beforeAfterCueNew\corrIMeanBefore.mat');
load('D:\GarretData\IdenticalCueData\tracks234\env4Day1_beforeAfterCueNew\corrNIMeanBefore.mat');
load('D:\GarretData\IdenticalCueData\tracks234\env4Day1_beforeAfterCueNew\corrIMeanAfter.mat');
load('D:\GarretData\IdenticalCueData\tracks234\env4Day1_beforeAfterCueNew\corrNIMeanAfter.mat');
%use all distances

corrIMeanAllBefore={};% if there are two cells, merge them
for n=1:length(corrIMeanBefore);
    a=corrIMeanBefore{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        corrIMeanAllBefore{n}=aa;
end

corrIMeanAllAfter={};% if there are two cells, merge them
for n=1:length(corrIMeanAfter);
    a=corrIMeanAfter{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        corrIMeanAllAfter{n}=aa;
end

corrNIMeanAllBefore={};% if there are two cells, merge them
for n=1:length(corrNIMeanBefore);
        a=corrNIMeanBefore{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        corrNIMeanAllBefore{n}=aa;
end

corrNIMeanAllAfter={};% if there are two cells, merge them
for n=1:length(corrNIMeanAfter);
        a=corrNIMeanAfter{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
        corrNIMeanAllAfter{n}=aa;
end


allIBefore{1}=[allIBefore{1} corrIMeanAllBefore{1}];%100
allIBefore{2}=allIBefore{2};%200  
allIBefore{3}=[allIBefore{3} corrIMeanAllBefore{2}];%275   
allIBefore{4}=allIBefore{4};%350  
allIBefore{5}=[allIBefore{5} corrIMeanAllBefore{3}]; %450 
allIBefore{6}=[allIBefore{6} corrIMeanAllBefore{4}]; %550
allIBefore{7}=corrIMeanAllBefore{5};%725
allIBefore{8}=corrIMeanAllBefore{6};%825

allIAfter{1}=[allIAfter{1} corrIMeanAllAfter{1}];%100
allIAfter{2}=allIAfter{2};%200  
allIAfter{3}=[allIAfter{3} corrIMeanAllAfter{2}];%275   
allIAfter{4}=allIAfter{4};%350  
allIAfter{5}=[allIAfter{5} corrIMeanAllAfter{3}]; %450 
allIAfter{6}=[allIAfter{6} corrIMeanAllAfter{4}]; %550
allIAfter{7}=corrIMeanAllAfter{5};%725
allIAfter{8}=corrIMeanAllAfter{6};%825

allNIBefore{1}=[allNIBefore{1} corrNIMeanAllBefore{1}];%100
allNIBefore{2}=[allNIBefore{2} corrNIMeanAllBefore{2}]; %175
allNIBefore{3}=[allNIBefore{3} corrNIMeanAllBefore{3}]; %275
allNIBefore{4}=allNIBefore{4};%375 
allNIBefore{5}=[allNIBefore{5} corrNIMeanAllBefore{4}]; %450
allNIBefore{6}=[allNIBefore{6} corrNIMeanAllBefore{5}]; %450
allNIBefore{8}=allNIBefore{7};%MOVE 7 TO 8:650
allNIBefore{7}=corrNIMeanAllBefore{6};%625
allNIBefore{8}=allNIBefore{8};%650
allNIBefore{9}=corrNIMeanAllBefore{7};%725

allNIAfter{1}=[allNIAfter{1} corrNIMeanAllAfter{1}];%100
allNIAfter{2}=[allNIAfter{2} corrNIMeanAllAfter{2}]; %175
allNIAfter{3}=[allNIAfter{3} corrNIMeanAllAfter{3}]; %275
allNIAfter{4}=allNIAfter{4};%375 
allNIAfter{5}=[allNIAfter{5} corrNIMeanAllAfter{4}]; %450
allNIAfter{6}=[allNIAfter{6} corrNIMeanAllAfter{5}]; %450
allNIAfter{8}=allNIAfter{7};%MOVE 7 TO 8:650
allNIAfter{7}=corrNIMeanAllAfter{6};%625
allNIAfter{8}=allNIAfter{8};%650
allNIAfter{9}=corrNIMeanAllAfter{7};%725
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

title(['correrences ALL']);
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

saveas(gcf,'correrencesAllDistance.fig')
print -painters -depsc correrencesAllDistance.eps

