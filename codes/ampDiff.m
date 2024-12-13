function [ampDiffIMean,ampDiffNIMean,ampDiffIPeak,ampDiffNIPeak] = ampDiff(useIdx,useFolders,allDistancesIGroup,allDistancesNIGroup,cueCellDataThresh)
%for identical and non-identical cue analysis, calculated activity
%differences between pairs of cues (identical or unldentical);
%input
% (1) useIdx: cell structure, each cell is the idx in one fov
% (2) useFolder: the folder of  one fov
% (3) allDistancesIGroup: For identical cues: same distances are grouped
% together: each cell is one distance. within each cell: first column is
% the first cue, the second column is the second cue, third column is
% distance in bins, the 4th column is distance in cm. binwidth is 5cm.
% (4) allDistancesNIGroup: For NON-identical cues: same distances are grouped
% together: each cell is one distance. within each cell: first column is
% the first cue, the second column is the second cue, third column is
% distance in bins, the 4th column is distance in cm. bin width is 5cm
% (5) cueCellDataThresh: the threshold calculating cue cells. can be 95, 90, 85, 80...just a number. no ''
% 
% %output:
% ampDiffIMean: cue response difference for identical cues, calcualted by the mean response
% ampDiffNIMean: cue response difference for NON-identical cues, calcualted by the mean response
% ampDiffIPeak: cue response difference for identical cues, calcualted by the peak response
% ampDiffNIPeak: cue response difference for NON-identical cues, calcualted by the peak response
%%
p=pwd;
%amplitude
ampDiffIMean={};%at all distances, follows the allDistancesIGroup
ampDiffNIMean={};%at all distances, follows the allDistancesIGroup
ampDiffIPeak={};%at all distances, follows the allDistancesIcueCellsAllThresh80Group
ampDiffNIPeak={};%at all distances, follows the allDistancesIGroup

    for m=1:length(allDistancesIGroup);%every distance 
        ampDiffIMean{m}={};
        ampDiffIPeak{m}={};

        for i=1:size(allDistancesIGroup{m},1); %every cue pairs in ths distance
            ampDiffIMean{m}{i}=[];
            ampDiffIPeak{m}{i}=[];
            
        end
    end
    

     for m=1:length(allDistancesNIGroup);%every distance 
        ampDiffNIMean{m}={};
        ampDiffNIPeak{m}={};
        for i=1:size(allDistancesNIGroup{m},1); %every cue pairs in ths distance
            ampDiffNIMean{m}{i}=[];
            ampDiffNIPeak{m}{i}=[];
        end
     end

for n=1:length(useFolders) %every mouse every FOV
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
    useDfof=data.dfofAvg(:,useCellIdx)';%each row is one cell
    usePeakBins=data.peakBins(useCellIdx);

    %identical cue
    for m=1:length(allDistancesIGroup);%every distance 
        % ampDiffIMean{m}={};
        % ampDiffIPeak{m}={};

        for i=1:size(allDistancesIGroup{m},1); %every cue pairs in ths distance
            % ampDiffIMean{m}{i}=[];
            % ampDiffIPeak{m}{i}=[];

            cue1=allDistancesIGroup{m}(i,1);
            cue2=allDistancesIGroup{m}(i,2);

            %amplitude: per cell
            for ii=1:length(useCellIdx);%every cell
                f=useDfof(ii,:);
                cueBin1=usePeakBins{ii}{cue1};
                cueBin2=usePeakBins{ii}{cue2};
                fcue1=f(cueBin1);
                fcue2=f(cueBin2);
                fcue1=fcue1(~isnan(fcue1));%remove all nan values
                fcue2=fcue2(~isnan(fcue2));
                
                ffcue1Mean=mean(fcue1);
                ffcue2Mean=mean(fcue2);

                ffcue1Peak=max(fcue1);
                ffcue2Peak=max(fcue2);
               if isempty(ffcue1Peak)
                    ffcue1Peak=nan;
                end
                
                  if isempty(ffcue2Peak)
                    ffcue2Peak=nan;
                end

                % amplitdue differences
                ampDiffIMean{m}{i}(end+1)=abs((ffcue1Mean-ffcue2Mean)/(ffcue1Mean+ffcue2Mean));
                ampDiffIPeak{m}{i}(end+1)=abs((ffcue1Peak-ffcue2Peak)/(ffcue1Peak+ffcue2Peak));
                
            end            

        end
    end

 %non-identical cue
    for m=1:length(allDistancesNIGroup);%every distance 
        % ampDiffNIMean{m}={};
        % ampDiffNIPeak{m}={};
        for i=1:size(allDistancesNIGroup{m},1); %every cue pairs in ths distance
            % ampDiffNIMean{m}{i}=[];
            % ampDiffNIPeak{m}{i}=[];
            cue1=allDistancesNIGroup{m}(i,1);
            cue2=allDistancesNIGroup{m}(i,2);
            for ii=1:length(useCellIdx);%every cell
                f=useDfof(ii,:);
                cueBin1=usePeakBins{ii}{cue1};
                cueBin2=usePeakBins{ii}{cue2};
                fcue1=f(cueBin1);
                fcue2=f(cueBin2);
                fcue1=fcue1(~isnan(fcue1));%remove all nan values
                fcue2=fcue2(~isnan(fcue2));
                ffcue1Mean=mean(fcue1);
                ffcue2Mean=mean(fcue2);

                ffcue1Peak=max(fcue1);
                ffcue2Peak=max(fcue2);
              if isempty(ffcue1Peak)
                    ffcue1Peak=nan;
                end
                
                  if isempty(ffcue2Peak)
                    ffcue2Peak=nan;
                end

                ampDiffNIMean{m}{i}(end+1)=abs((ffcue1Mean-ffcue2Mean)/(ffcue1Mean+ffcue2Mean));
                ampDiffNIPeak{m}{i}(end+1)=abs((ffcue1Peak-ffcue2Peak)/(ffcue1Peak+ffcue2Peak));
                
            end
        end
    end

end
cd(p)
end