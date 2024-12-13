%% PLOTTING WHETHER THE DIFF FOR I and NI are correlated per cell
% load("lags.mat");
load('corrIMean.mat');
load('corrNIMean.mat');


corrIMean=corrIMean;

corrNIMean=corrNIMean;


IMean=[];
for n=1:length(corrIMean);
    for m=1:length(corrIMean{n})
        IMean(:,end+1)=corrIMean{n}{m};
    end
end

NIMean=[];
for n=1:length(corrNIMean);
    for m=1:length(corrNIMean{n})
        NIMean(:,end+1)=corrNIMean{n}{m};
    end
end

    IMeanMean=nanmean(IMean,2);
    NIMeanMean=nanmean(NIMean,2);

%plot the ability of distinguish cues: whether I and NI are correlated

% lagsAll=cell2mat(lags);
% colormapLags=[];
% for n=1:length(lagsAll)
%     if lagsAll(n)>0;
%         colormapLags(n,:)=[0 0 0];%fire before is black
%     elseif lagsAll(n)<0
%         colormapLags(n,:)=[1 0 0];
%     else %==0
%         colormapLags(n,:)=[0.6 0.6 0.6];
%     end
% end

figure

a=[IMeanMean NIMeanMean];
asum=sum(a,2);
i=find(~isnan(asum));%remove the data with nan
a=a(i,:);
% colormapLagsI=colormapLags(i,:);
subplot(2,2,1);
plot(a(:,1),a(:,2),'k.')
% for n=1:length(i);
%     hold on
%     plot(a(n,1),a(n,2),'.','Color',colormapLagsI(n,:));
% end
xlabel('I')
ylabel('NI')
axis square
[~,p1]=corr(a(:,1),a(:,2));
hold on
line([min([a(:,1);a(:,2)]) 1],[min([a(:,1);a(:,2)]) 1]);
axis tight
axis square
title(['I vs NI mean all dis',num2str(p1)])

% calculate whether there are more cells with larger NI, or larger I

subplot(222)
load('useIdx.mat')
% idxRange=[1 100];
% for n=1:9;
%     idxRange(n+1,:)=idxRange(n,:)+100;
% end

idxRange=[0 0];
for n=1:length(useIdx);
    idxRange(n+1,1)=idxRange(n,2)+1;
    idxRange(n+1,2)=idxRange(n,2)+length(useIdx{n});
end
idxRange=idxRange(2:end,:);

a=[IMeanMean NIMeanMean];
b=a(:,1)-a(:,2);
c=nan(length(b),1);
c(b>0)=1;
c(b<0)=0;

pCellFOV=[];%percentage of cells
for n=1:size(idxRange,1);
    t=c(idxRange(n,1):idxRange(n,2));
    pCellFOV(n,1)=length(find(t==1));
    pCellFOV(n,2)=length(find(t==0));
        NTotal=idxRange(n,2)-idxRange(n,1)+1;

    pCellFOV(n,1)=pCellFOV(n,1)/NTotal;
    pCellFOV(n,2)=pCellFOV(n,2)/NTotal;
end


M=nanmean(pCellFOV,1);
S=nansem(pCellFOV,1);

bar([1 2],M);
hold on
errorbar([1 2],M,S,'k.');
for n=1:size(pCellFOV,1)
    hold on
    plot([1 2],pCellFOV(n,:),'k')
end

xlim([0 3]);
name = {'I>NI';'I<NI'};
set(gca,'xticklabel',name)
[~,p1]=ttest(pCellFOV(:,1),pCellFOV(:,2));
title(['PerGroup mean',num2str(p1)])

%%
idxI=[1 3 5 6];
idxNI=[1 3 5 6];

corrIMean=corrIMean(idxI);

corrNIMean=corrNIMean(idxNI);


IMean=[];
for n=1:length(corrIMean);
    for m=1:length(corrIMean{n})
        IMean(:,end+1)=corrIMean{n}{m};
    end
end

NIMean=[];
for n=1:length(corrNIMean);
    for m=1:length(corrNIMean{n})
        NIMean(:,end+1)=corrNIMean{n}{m};
    end
end

    IMeanMean=nanmean(IMean,2);
    NIMeanMean=nanmean(NIMean,2);

%plot the ability of distinguish cues: whether I and NI are correlated

a=[IMeanMean NIMeanMean];
asum=sum(a,2);
i=find(~isnan(asum));%remove the data with nan
a=a(i,:);

subplot(2,2,3);
plot(a(:,1),a(:,2),'k.')

xlabel('I')
ylabel('NI')
axis square
[~,p1]=corr(a(:,1),a(:,2));
hold on
line([min([a(:,1);a(:,2)]) 1],[min([a(:,1);a(:,2)]) 1]);
axis tight
axis square
title(['I vs NI mean match dis',num2str(p1)])

% calculate whether there are more cells with larger NI, or larger I

subplot(224)
% idxRange=[1 100];
% for n=1:9;
%     idxRange(n+1,:)=idxRange(n,:)+100;
% end


idxRange=[0 0];
for n=1:length(useIdx);
    idxRange(n+1,1)=idxRange(n,2)+1;
    idxRange(n+1,2)=idxRange(n,2)+length(useIdx{n});
end
idxRange=idxRange(2:end,:);

a=[IMeanMean NIMeanMean];
b=a(:,1)-a(:,2);
c=nan(length(b),1);
c(b>0)=1;
c(b<0)=0;

pCellFOV=[];%percentage of cells
for n=1:size(idxRange,1);
    t=c(idxRange(n,1):idxRange(n,2));
    pCellFOV(n,1)=length(find(t==1));
    pCellFOV(n,2)=length(find(t==0));
       NTotal=idxRange(n,2)-idxRange(n,1)+1;

    pCellFOV(n,1)=pCellFOV(n,1)/NTotal;
    pCellFOV(n,2)=pCellFOV(n,2)/NTotal;
end


M=nanmean(pCellFOV,1);
S=nansem(pCellFOV,1);

bar([1 2],M);
hold on
errorbar([1 2],M,S,'k.');
for n=1:size(pCellFOV,1)
    hold on
    plot([1 2],pCellFOV(n,:),'k')
end

xlim([0 3]);
name = {'I>NI';'I<NI'};
set(gca,'xticklabel',name)
[~,p1]=ttest(pCellFOV(:,1),pCellFOV(:,2));
title(['PerCell mean',num2str(p1)])
saveas(gcf,'lagPlotForPaper_corr_allBlack.fig')
print -painters -depsc lagPlotForPaper_corr_allBlack.eps
