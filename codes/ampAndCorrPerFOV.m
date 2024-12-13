load('allDistancesI.mat')
load('allDistancesIGroup.mat')
load('allDistancesNI.mat')
load('allDistancesNIGroup.mat')

load('ampDiffIMean.mat');
load('ampDiffNIMean.mat');

load('corrIMean.mat');
load('corrNIMean.mat');
load('useIdx.mat');

idxI=[1 3 5 6];
idxNI=[1 3 5 6];

NCells=[];%n cells per FOV
for n=1:length(useIdx);
NCells(n)=length(useIdx{n});
end
NCells=[0 NCells];
NCellsFOV=[];
for n=1:length(useIdx);
    NCellsFOV(n,1)=sum(NCells(1:n))+1;
    NCellsFOV(n,2)=sum(NCells(1:n+1));
end

%%

ampDiffIMeanAll=[];% if there are two cells, merge them

for n=1:length(ampDiffIMean);
    a=ampDiffIMean{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';

        ampDiffIMeanAll(:,n)=aa;
end

ampDiffIMeanAllMatch=ampDiffIMeanAll(:,idxI);

ampDiffNIMeanAll=[];% if there are two cells, merge them

for n=1:length(ampDiffNIMean);
        a=ampDiffNIMean{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
    
        ampDiffNIMeanAll(:,n)=aa;
end

ampDiffNIMeanAllMatch=ampDiffNIMeanAll(:,idxNI);


distanceOnlyI=unique(allDistancesI(:,end));
distanceOnlyI=distanceOnlyI(idxI);

distanceOnlyNI=unique(allDistancesNI(:,end));
distanceOnlyNI=distanceOnlyNI(idxNI);
%% per mouse
ampDiffIMeanAllMatchFOV=[];
ampDiffNIMeanAllMatchFOV=[];


for n=1:length(useIdx);
    ampDiffIMeanAllMatchFOV(n,:)=nanmean(ampDiffIMeanAllMatch(NCellsFOV(n,1):NCellsFOV(n,2),:),1);
    ampDiffNIMeanAllMatchFOV(n,:)=nanmean(ampDiffNIMeanAllMatch(NCellsFOV(n,1):NCellsFOV(n,2),:),1);
end

% ampDiffIMeanAllMatchFOV=ampDiffIMeanAllMatchFOV(1:2:9,:)+ampDiffIMeanAllMatchFOV(2:2:10,:);
% ampDiffNIMeanAllMatchFOV=ampDiffNIMeanAllMatchFOV(1:2:9,:)+ampDiffNIMeanAllMatchFOV(2:2:10,:);

 [pAnova,pMC,pLabel] = anovaRM2W_full_BH(ampDiffIMeanAllMatchFOV,ampDiffNIMeanAllMatchFOV,1);

figure,
subplot(221)
errorbar(distanceOnlyI,nanmean(ampDiffIMeanAllMatchFOV,1),nansem(ampDiffIMeanAllMatchFOV,1),'g')
hold on
errorbar(distanceOnlyNI,nanmean(ampDiffNIMeanAllMatchFOV,1),nansem(ampDiffNIMeanAllMatchFOV,1),'m')
title(['amp Anova',num2str(pAnova(1))]);
pbaspect([1 0.8945 1])

subplot(222)

a=ampDiffIMeanAllMatchFOV;
b=ampDiffNIMeanAllMatchFOV;

a=reshape(a,[size(a,1)*size(a,2),1]);
b=reshape(b,[size(b,1)*size(b,2),1]);

c={};
c{1}='I';%common
c{2}='NI';%unique
color=[0 1 0;1 0 1];

%data
All=[];
for n=1:size(a,2);
    All=[All;a(:,n)];
end
for n=1:size(b,2);
    All=[All;b(:,n)];
end

AllC={};
for n=1:size(a,2),
    AllC=[AllC;repmat(c(n),size(a,1),1)];
end

for n=1:size(b,2),
    AllC=[AllC;repmat(c(n+1),size(b,1),1)];
end

violinplot(All, AllC,'ShowData',false,'ViolinColor',color,'ShowMean',true,'ShowWhiskers',false,'ShowBox',false);
xlim tight;

[~,p] = ttest(a, b);
pbaspect([1 2 1])
title(['ampDiffI vs NI, p=',num2str(p)])
%% 


corrIMeanAll=[];% if there are two cells, merge them

for n=1:length(corrIMean);
    a=corrIMean{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';

        corrIMeanAll(:,n)=aa;
end

corrIMeanAllMatch=corrIMeanAll(:,idxI);

corrNIMeanAll=[];% if there are two cells, merge them

for n=1:length(corrNIMean);
        a=corrNIMean{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
    
        corrNIMeanAll(:,n)=aa;
end

corrNIMeanAllMatch=corrNIMeanAll(:,idxNI);


distanceOnlyI=unique(allDistancesI(:,end));
distanceOnlyI=distanceOnlyI(idxI);

distanceOnlyNI=unique(allDistancesNI(:,end));
distanceOnlyNI=distanceOnlyNI(idxNI);
%% per mouse
corrIMeanAllMatchFOV=[];
corrNIMeanAllMatchFOV=[];


for n=1:length(useIdx);
    corrIMeanAllMatchFOV(n,:)=nanmean(corrIMeanAllMatch(NCellsFOV(n,1):NCellsFOV(n,2),:),1);
    corrNIMeanAllMatchFOV(n,:)=nanmean(corrNIMeanAllMatch(NCellsFOV(n,1):NCellsFOV(n,2),:),1);
end

% corrIMeanAllMatchFOV=corrIMeanAllMatchFOV(1:2:9,:)+corrIMeanAllMatchFOV(2:2:10,:);
% corrNIMeanAllMatchFOV=corrNIMeanAllMatchFOV(1:2:9,:)+corrNIMeanAllMatchFOV(2:2:10,:);

 [pAnova,pMC,pLabel] = anovaRM2W_full_BH(corrIMeanAllMatchFOV,corrNIMeanAllMatchFOV,1);


subplot(223)
errorbar(distanceOnlyI,nanmean(corrIMeanAllMatchFOV,1),nansem(corrIMeanAllMatchFOV,1),'g')
hold on
errorbar(distanceOnlyNI,nanmean(corrNIMeanAllMatchFOV,1),nansem(corrNIMeanAllMatchFOV,1),'m')
title(['amp Anova',num2str(pAnova(1))]);
pbaspect([1 0.8945 1])

subplot(224)

a=corrIMeanAllMatchFOV;
b=corrNIMeanAllMatchFOV;

a=reshape(a,[size(a,1)*size(a,2),1]);
b=reshape(b,[size(b,1)*size(b,2),1]);

c={};
c{1}='I';%common
c{2}='NI';%unique
color=[0 1 0;1 0 1];

%data
All=[];
for n=1:size(a,2);
    All=[All;a(:,n)];
end
for n=1:size(b,2);
    All=[All;b(:,n)];
end

AllC={};
for n=1:size(a,2),
    AllC=[AllC;repmat(c(n),size(a,1),1)];
end

for n=1:size(b,2),
    AllC=[AllC;repmat(c(n+1),size(b,1),1)];
end

violinplot(All, AllC,'ShowData',false,'ViolinColor',color,'ShowMean',true,'ShowWhiskers',false,'ShowBox',false);
xlim tight;

[~,p] = ttest(a, b);
pbaspect([1 2 1])
title(['corrI vs NI, p=',num2str(p)])

saveas(gcf,'ampCorrPerFOV.fig');
print -painters -depsc ampCorrPerFOV.eps

%% the differences are compared to zero
diffAmp=ampDiffNIMeanAllMatchFOV-ampDiffIMeanAllMatchFOV;
diffCorr=corrNIMeanAllMatchFOV-corrIMeanAllMatchFOV;

figure,
subplot(221);
errorbar(distanceOnlyI,nanmean(diffAmp,1),nansem(diffAmp,1),'k')
title('diff in ampDiff')
subplot(222);
%compare with zero
a=reshape(diffAmp,[size(diffAmp,1)*size(diffAmp,2),1]);
c={};
c{1}='INI';%identical
color=[0.4 0.4 0.4];
%data
All=[];
for n=1:size(a,2);
    All=[All;a(:,n)];
end
%category
AllC={};
for n=1:size(a,2),
    AllC=[AllC;repmat(c(n),size(a,1),1)];
end

violinplot(All, AllC,'ShowData',false,'ViolinColor',color,'ShowMean',true,'ShowWhiskers',false,'ShowBox',false);
hold on
line([0.3 1.7],[0 0])
xlim tight
pbaspect([1 2 1])
[~,p1]=ttest(a,0);
title(['p=',num2str(p1)])

subplot(223);
errorbar(distanceOnlyI,nanmean(diffCorr,1),nansem(diffCorr,1),'k')
title('diff in corr')
subplot(224);
%compare with zero
a=reshape(diffCorr,[size(diffCorr,1)*size(diffCorr,2),1]);
c={};
c{1}='INI';%identical
color=[0.4 0.4 0.4];
%data
All=[];
for n=1:size(a,2);
    All=[All;a(:,n)];
end
%category
AllC={};
for n=1:size(a,2),
    AllC=[AllC;repmat(c(n),size(a,1),1)];
end

violinplot(All, AllC,'ShowData',false,'ViolinColor',color,'ShowMean',true,'ShowWhiskers',false,'ShowBox',false);
hold on
line([0.3 1.7],[0 0])
xlim tight
pbaspect([1 2 1])
[~,p1]=ttest(a,0);
title(['p=',num2str(p1)])
saveas(gcf,'ampCorrDiffPerFOV.fig');
print -painters -depsc ampCorrDiffPerFOV.eps
