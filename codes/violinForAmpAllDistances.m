load('ampDiffIMean.mat')
load('ampDiffNIMean.mat')

ampDiffIMeanAll={};% if there are two cells, merge them

for n=1:length(ampDiffIMean);
    a=ampDiffIMean{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
     ampDiffIMeanAll{n}=aa;
end

 ampDiffIMeanAll=cell2mat(ampDiffIMeanAll)';

ampDiffNIMeanAll={};% if there are two cells, merge them

for n=1:length(ampDiffNIMean);
        a=ampDiffNIMean{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
    
        ampDiffNIMeanAll{n}=aa;
end


ampDiffNIMeanAll=cell2mat(ampDiffNIMeanAll)';

 %%
a=ampDiffIMeanAll;
b=ampDiffNIMeanAll;

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

figure
subplot(121)
%category
AllC={};
for n=1:size(a,2),
    AllC=[AllC;repmat(c(n),size(a,1),1)];
end

for n=1:size(b,2),
    AllC=[AllC;repmat(c(n+1),size(b,1),1)];
end
violinplot(All, AllC,'ShowData',false,'ViolinColor',color,'ShowMean',true,'ShowWhiskers',false,'ShowBox',false);
xlim tight;

[~,p] = ttest2(a, b);
pbaspect([1 2 1])
title(['ampDiffI vs NI, p=',num2str(p)])

%%
%only  matched distances
%only use matched distances
idxI=[1 3 5 6];
idxNI=[1 3 5 6];

ampDiffIMeanAll={};% if there are two cells, merge them

for n=1:length(ampDiffIMean);
    a=ampDiffIMean{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
     ampDiffIMeanAll{n}=aa;
end

 ampDiffIMeanAll=cell2mat(ampDiffIMeanAll(idxI))';

ampDiffNIMeanAll={};% if there are two cells, merge them

for n=1:length(ampDiffNIMean);
        a=ampDiffNIMean{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
    
        ampDiffNIMeanAll{n}=aa;
end


ampDiffNIMeanAll=cell2mat(ampDiffNIMeanAll(idxNI))';

 %%
a=ampDiffIMeanAll;
b=ampDiffNIMeanAll;

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


subplot(122)
%category
AllC={};
for n=1:size(a,2),
    AllC=[AllC;repmat(c(n),size(a,1),1)];
end

for n=1:size(b,2),
    AllC=[AllC;repmat(c(n+1),size(b,1),1)];
end
violinplot(All, AllC,'ShowData',false,'ViolinColor',color,'ShowMean',true,'ShowWhiskers',false,'ShowBox',false);
xlim tight;

[~,p] = ttest2(a, b);
pbaspect([1 2 1])
title(['Match ampDiffI vs NI, p=',num2str(p)])
saveas(gcf,'ampDiffIvsNIViloin.fig');
print -painters -depsc ampDiffIvsNIViloin.eps

