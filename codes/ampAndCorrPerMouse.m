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
NCellsMouse=[];
for n=1:length(useIdx);
    NCellsMouse(n,1)=sum(NCells(1:n))+1;
    NCellsMouse(n,2)=sum(NCells(1:n+1));
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
ampDiffIMeanAllMatchMouse=[];
ampDiffNIMeanAllMatchMouse=[];


for n=1:length(useIdx);
    ampDiffIMeanAllMatchMouse(n,:)=nanmean(ampDiffIMeanAllMatch(NCellsMouse(n,1):NCellsMouse(n,2),:),1);
    ampDiffNIMeanAllMatchMouse(n,:)=nanmean(ampDiffNIMeanAllMatch(NCellsMouse(n,1):NCellsMouse(n,2),:),1);
end

ampDiffIMeanAllMatchMouse=(ampDiffIMeanAllMatchMouse(1:2:9,:)+ampDiffIMeanAllMatchMouse(2:2:10,:))/2;
ampDiffNIMeanAllMatchMouse=(ampDiffNIMeanAllMatchMouse(1:2:9,:)+ampDiffNIMeanAllMatchMouse(2:2:10,:))/2;

 [pAnova,pMC,pLabel] = anovaRM2W_full_BH(ampDiffIMeanAllMatchMouse,ampDiffNIMeanAllMatchMouse,1);

figure,
subplot(221)
errorbar(distanceOnlyI,nanmean(ampDiffIMeanAllMatchMouse,1),nansem(ampDiffIMeanAllMatchMouse,1),'g')
hold on
errorbar(distanceOnlyNI,nanmean(ampDiffNIMeanAllMatchMouse,1),nansem(ampDiffNIMeanAllMatchMouse,1),'m')
title(['amp Anova',num2str(pAnova(1))]);
pbaspect([1 0.8945 1])

subplot(222)

a=ampDiffIMeanAllMatchMouse;
b=ampDiffNIMeanAllMatchMouse;

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
corrIMeanAllMatchMouse=[];
corrNIMeanAllMatchMouse=[];


for n=1:length(useIdx);
    corrIMeanAllMatchMouse(n,:)=nanmean(corrIMeanAllMatch(NCellsMouse(n,1):NCellsMouse(n,2),:),1);
    corrNIMeanAllMatchMouse(n,:)=nanmean(corrNIMeanAllMatch(NCellsMouse(n,1):NCellsMouse(n,2),:),1);
end

corrIMeanAllMatchMouse=(corrIMeanAllMatchMouse(1:2:9,:)+corrIMeanAllMatchMouse(2:2:10,:))/2;
corrNIMeanAllMatchMouse=(corrNIMeanAllMatchMouse(1:2:9,:)+corrNIMeanAllMatchMouse(2:2:10,:))/2;

 [pAnova,pMC,pLabel] = anovaRM2W_full_BH(corrIMeanAllMatchMouse,corrNIMeanAllMatchMouse,1);


subplot(223)
errorbar(distanceOnlyI,nanmean(corrIMeanAllMatchMouse,1),nansem(corrIMeanAllMatchMouse,1),'g')
hold on
errorbar(distanceOnlyNI,nanmean(corrNIMeanAllMatchMouse,1),nansem(corrNIMeanAllMatchMouse,1),'m')
title(['amp Anova',num2str(pAnova(1))]);
pbaspect([1 0.8945 1])

subplot(224)

a=corrIMeanAllMatchMouse;
b=corrNIMeanAllMatchMouse;

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

saveas(gcf,'ampCorrPerMouse.fig');
print -painters -depsc ampCorrPerMouse.eps

%% the differences are compared to zero
diffAmp=ampDiffNIMeanAllMatchMouse-ampDiffIMeanAllMatchMouse;
diffCorr=corrNIMeanAllMatchMouse-corrIMeanAllMatchMouse;

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
saveas(gcf,'ampCorrDiffPerMouse.fig');
print -painters -depsc ampCorrDiffPerMouse.eps
