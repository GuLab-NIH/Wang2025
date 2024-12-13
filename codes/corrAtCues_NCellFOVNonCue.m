function [randomCells,corrIMean,corrNIMean,corrIPeak,corrNIPeak] = corrAtCues_NCellFOVNonCue(useIdx,useFolders,allDistancesIGroup,allDistancesNIGroup,NCell)

%the diffence between this one and corrAtCues_NCellFOV is that this can be
%used for non cue cells
%the difference betweent this function and corrAtCues is that it doesn't do
%NShuffle. the number of shuffle is the number of cells in the FOV
%this one also saves random cells
%select random cells so that each cell n in the FOV is not included, and
%select NCell from the remaining cell once.
%for identical and non-identical cue analysis, calculated the correlation of cell sequences (ordered based on their activity amplitudes (calculated based on mean or peak) between pairs of cues (identical or unldentical);
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
% (6) NCell: number of cell per sequence
% (7) NShuffle: number of shuffles selected from all cells

% 
% cueCellDataThresh: the threshold calculating cue cells. can be 95, 90, 85, 80...just a number. no ''
% %output:
% corrIMean: correlation of cell sequences at identical cues, calcualted by the mean response
% corrNIMean: correlation of cell sequences at NON-identical cues, calcualted by the mean response
% corrIPeak: correlation of cell sequences at identical cues, calcualted by the peak response
% corrNIPeak: correlation of cell sequences at NON-identical cues, calcualted by the peak response

%sequence
randomCells={};%each cell is one FOV
corrIMean={};%at all distances, follows the allDistancesIGroup
corrNIMean={};%at all distances, follows the allDistancesIGroup
corrIPeak={};%at all distances, follows the allDistancesIGroup
corrNIPeak={};%at all distances, follows the allDistancesIGroup
p=pwd;

for m=1:length(allDistancesIGroup);%every distance 

        corrIMean{m}={};
        corrIPeak{m}={};

            for i=1:size(allDistancesIGroup{m},1); %every cue pairs in ths distance

            corrIMean{m}{i}=[];
            corrIPeak{m}{i}=[];
            end
end

for m=1:length(allDistancesNIGroup);%every distance 

        corrNIMean{m}={};
        corrNIPeak{m}={};

            for i=1:size(allDistancesNIGroup{m},1); %every cue pairs in ths distance

            corrNIMean{m}{i}=[];
            corrNIPeak{m}{i}=[];
            end
end

for n=1:length(useFolders)
    randomCells{n}=[];
    disp(n)
    cd(useFolders{n});
    cells=useIdx{n};


    % if cueCellDataThresh==95;
    %     filename1='cueAnalysis_sig\newScoreShuffleTemplate\cueCellsAllThresh.mat';
    %     filename2='cueCellsAllThresh';
    % else
    %     filename1=sprintf('%s%d.mat','cueAnalysis_sig\newScoreShuffleTemplate\cueCellsAllThresh',cueCellDataThresh);
    %     filename2=['cueCellsAllThresh',num2str(cueCellDataThresh)];
    % end
    % 
    % load(filename1);
    % data=eval(filename2);
    load('cueAnalysis_sig\newScoreShuffleTemplate\cueCells.mat')
    data=cueCells;

    %randomly pick cells for all comparisons
    NAllCells=length(cells);
    for iii=1:NAllCells;
        %use the ramining cells
        thiscells=cells(1:end~=iii);

                all=randperm(length(thiscells));
                idx=all(1:NCell);
                selectedCells=thiscells(idx);%pick one
                
randomCells{n}(:,iii)=selectedCells;
    % [~,useCellIdx,~]=intersect(data.realIdx,selectedCells);
    % useDfof=data.dfofAvg(:,useCellIdx)';%each row is one cell
    % usePeakBins=data.peakBins(useCellIdx); 

    [~,useCellIdx,~]=intersect(data.useIdx,selectedCells);
    useDfof=data.useDfofaverage(:,useCellIdx)';%each row is one cell
    usePeakBins=data.peakBins(useCellIdx); 

for m=1:length(allDistancesIGroup);%every distance 

        % corrIMean{m}={};
        % corrIPeak{m}={};

            for i=1:size(allDistancesIGroup{m},1); %every cue pairs in ths distance

            % corrIMean{m}{i}=[];
            % corrIPeak{m}{i}=[];
            cue1=allDistancesIGroup{m}(i,1);
            cue2=allDistancesIGroup{m}(i,2);

            %amplitude: per cell
            cue1PeakAll=[];%peak amplitudes of all cells at cue1
            cue1MeanAll=[];%peak amplitudes of all cells at cue1

            cue2PeakAll=[];%peak amplitudes of all cells at cue1
            cue2MeanAll=[];%peak amplitudes of all cells at cue1

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
    
                %for sequence analysis
                cue1MeanAll(ii)=ffcue1Mean;
                cue2MeanAll(ii)=ffcue2Mean;

                cue1PeakAll(ii)=ffcue1Peak;
                cue2PeakAll(ii)=ffcue2Peak;
            end

%sequence correlation: many cells
%remove all cells that has nan
c=cue1PeakAll+cue2PeakAll+cue1MeanAll+cue2MeanAll;
removeIdx=find(isnan(c));
leftIdx=setdiff([1:1;length(cue1PeakAll)],removeIdx);
cue1PeakAll=cue1PeakAll;
cue2PeakAll=cue2PeakAll;
cue1MeanAll=cue1MeanAll;
cue2MeanAll=cue2MeanAll;

            % NAllCells=length(cells);
            % for iii=1:NShuffle;
            %     all=randperm(NAllCells);
            %     idx=all(1:NCell);
            %     cue1PeakThis=cue1PeakAll(idx);
            %     cue2PeakThis=cue2PeakAll(idx);

            %originally used sort
                % [~,cue1Order]=sort(cue1PeakAll);
                % [~,cue2Order]=sort(cue2PeakAll);

                [cue1Order,~]=tiedrank(cue1PeakAll);
                 [cue2Order,~]=tiedrank(cue2PeakAll);

                corrIPeak{m}{i}(end+1)=corr(cue1Order',cue2Order');

                % cue1MeanThis=cue1MeanAll(idx);
                % cue2MeanThis=cue2MeanAll(idx);

                %originally used sort
                % [~,cue1Order]=sort(cue1MeanAll);
                % [~,cue2Order]=sort(cue2MeanAll);

                  [cue1Order,~]=tiedrank(cue1MeanAll);
                 [cue2Order,~]=tiedrank(cue2MeanAll);

                corrIMean{m}{i}(end+1)=corr(cue1Order',cue2Order');
            end
            end



%non-identical cues
for m=1:length(allDistancesNIGroup);%every distance 

        % corrNIMean{m}={};
        % corrNIPeak{m}={};

            for i=1:size(allDistancesNIGroup{m},1); %every cue pairs in ths distance

            % corrNIMean{m}{i}=[];
            % corrNIPeak{m}{i}=[];
            cue1=allDistancesNIGroup{m}(i,1);
            cue2=allDistancesNIGroup{m}(i,2);

            %amplitude: per cell
            cue1PeakAll=[];%peak amplitudes of all cells at cue1
            cue1MeanAll=[];%peak amplitudes of all cells at cue1

            cue2PeakAll=[];%peak amplitudes of all cells at cue1
            cue2MeanAll=[];%peak amplitudes of all cells at cue1

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
    
                %for sequence analysis
                cue1MeanAll(ii)=ffcue1Mean;
                cue2MeanAll(ii)=ffcue2Mean;

                cue1PeakAll(ii)=ffcue1Peak;
                cue2PeakAll(ii)=ffcue2Peak;
            end

%sequence correlation: many cells
%remove all cells that has nan
c=cue1PeakAll+cue2PeakAll+cue1MeanAll+cue2MeanAll;
removeIdx=find(isnan(c));
leftIdx=setdiff([1:1;length(cue1PeakAll)],removeIdx);
cue1PeakAll=cue1PeakAll;
cue2PeakAll=cue2PeakAll;
cue1MeanAll=cue1MeanAll;
cue2MeanAll=cue2MeanAll;

            % NAllCells=length(cells);
            % for iii=1:NShuffle;
            %     all=randperm(NAllCells);
            %     idx=all(1:NCell);
            %     cue1PeakThis=cue1PeakAll(idx);
            %     cue2PeakThis=cue2PeakAll(idx);
            %originally used sort
                % [~,cue1Order]=sort(cue1PeakAll);
                % [~,cue2Order]=sort(cue2PeakAll);

                 [cue1Order,~]=tiedrank(cue1PeakAll);
                 [cue2Order,~]=tiedrank(cue2PeakAll);

                corrNIPeak{m}{i}(end+1)=corr(cue1Order',cue2Order');
                % 
                % cue1MeanThis=cue1MeanAll(idx);
                % cue2MeanThis=cue2MeanAll(idx);
                %originally used sort
                % [~,cue1Order]=sort(cue1MeanAll);
                % [~,cue2Order]=sort(cue2MeanAll);
                 [cue1Order,~]=tiedrank(cue1MeanAll);
                 [cue2Order,~]=tiedrank(cue2MeanAll);

                corrNIMean{m}{i}(end+1)=corr(cue1Order',cue2Order');
            end
            end
end
end


cd(p);

end