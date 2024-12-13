load('corrIMean.mat')
load('corrNIMean.mat')

corrIMeanAll={};% if there are two cells, merge them

for n=1:length(corrIMean);
    a=corrIMean{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
     corrIMeanAll{n}=aa;
end

 corrIMeanAll=cell2mat(corrIMeanAll)';

corrNIMeanAll={};% if there are two cells, merge them

for n=1:length(corrNIMean);
        a=corrNIMean{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
    
        corrNIMeanAll{n}=aa;
end


corrNIMeanAll=cell2mat(corrNIMeanAll)';

 %%
a=corrIMeanAll;
b=corrNIMeanAll;

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
title(['corrI vs NI, p=',num2str(p)])

%%
%only  matched distances
%only use matched distances
idxI=[1 3 5 6];
idxNI=[1 3 5 6];

corrIMeanAll={};% if there are two cells, merge them

for n=1:length(corrIMean);
    a=corrIMean{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
     corrIMeanAll{n}=aa;
end

 corrIMeanAll=cell2mat(corrIMeanAll(idxI))';

corrNIMeanAll={};% if there are two cells, merge them

for n=1:length(corrNIMean);
        a=corrNIMean{n};
    for m=1:length(a);
        a{m}=a{m}';
    end
    aa=nanmean(cell2mat(a),2)';
    
        corrNIMeanAll{n}=aa;
end


corrNIMeanAll=cell2mat(corrNIMeanAll(idxNI))';

 %%
a=corrIMeanAll;
b=corrNIMeanAll;

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
title(['Match corrI vs NI, p=',num2str(p)])
saveas(gcf,'corrIvsNIViloin.fig');
print -painters -depsc corrIvsNIViloin.eps

