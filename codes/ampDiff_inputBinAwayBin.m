function [ampDiffIMean,ampDiffNIMean,ampDiffIPeak,ampDiffNIPeak] = ampDiff_inputBinAwayBin(useIdx,useFolders,allDistancesIGroupWithCueBin,allDistancesNIGroupWithCueBin,expandBin,awaybin)
%similar to allDiff_inputBin but difference is that added away bin so can
%be certain bins away from cue center

%similar to ampDiff: but for grid cells and other cells：just input the
%bins. Because those cells do not have peakBins, like cue cells

%for identical and non-identical cue analysis, calculated activity
%differences between pairs of cues (identical or unldentical);
%input
% (1) useIdx: cell structure, each cell is the idx in one fov
% (2) useFolder: the folder of  one fov
% (3) allDistancesIGroup: For identical cues: same distances are grouped
% together: each cell is one distance. within each cell: first column is
% the first cue, the second column is the second cue, third column is
% distance in bins, the 4th column is distance in cm. binwidth is 5cm.
% (4) allDistancesNIGroupWithCueBin: For NON-identical cues: same distances are grouped
% together: each cell is one distance. within each cell: first column is
% the first cue, the second column is the second cue, third column is
% distance in bins, the 4th column is distance in cm. bin width is 5cm
%columns 5 and 6 are the beginning and end of the first cue, columns 7 and
%8 are the begining and end of the second cue
% (5) expandBin: how many bins  to expand from bin center
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

    for m=1:length(allDistancesIGroupWithCueBin);%every distance 
        ampDiffIMean{m}={};
        ampDiffIPeak{m}={};

        for i=1:size(allDistancesIGroupWithCueBin{m},1); %every cue pairs in ths distance
            ampDiffIMean{m}{i}=[];
            ampDiffIPeak{m}{i}=[];
            
        end
    end
    

     for m=1:length(allDistancesNIGroupWithCueBin);%every distance 
        ampDiffNIMean{m}={};
        ampDiffNIPeak{m}={};
        for i=1:size(allDistancesNIGroupWithCueBin{m},1); %every cue pairs in ths distance
            ampDiffNIMean{m}{i}=[];
            ampDiffNIPeak{m}{i}=[];
        end
     end

for n=1:length(useFolders) %every mouse every FOV
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

    % load(filename1);
    % data=eval(filename2);
    % [~,useCellIdx,~]=intersect(data.realIdx,cells);

    df=dir('dfofaveragesmooth_sig*');
    for dfi=1:length(df);
        load(df(dfi).name);
    end
    useDfof=dfofaveragesmooth_sig(:,cells)';%each row is one cell
    % usePeakBins=data.peakBins(useCellIdx);

    %identical cue
    for m=1:length(allDistancesIGroupWithCueBin);%every distance 
        % ampDiffIMean{m}={};
        % ampDiffIPeak{m}={};

        for i=1:size(allDistancesIGroupWithCueBin{m},1); %every cue pairs in ths distance
            % ampDiffIMean{m}{i}=[];
            % ampDiffIPeak{m}{i}=[];
            % 
            % cue1=allDistancesIGroup{m}(i,1);
            % cue2=allDistancesIGroup{m}(i,2);

        cue1BinCenter=ceil(sum(allDistancesIGroupWithCueBin{m}(i,[5 6]))/2)-1;
        removeBin=[cue1BinCenter-awaybin+1:cue1BinCenter+awaybin];
        cue1Bin=[cue1BinCenter-awaybin-expandBin+1:cue1BinCenter+awaybin+expandBin];
        cueBin1=setdiff(cue1Bin,removeBin);
  cue2BinCenter=ceil(sum(allDistancesIGroupWithCueBin{m}(i,[7 8]))/2)-1;
        removeBin=[cue2BinCenter-awaybin+1:cue2BinCenter+awaybin];
        cue2Bin=[cue2BinCenter-awaybin-expandBin+1:cue2BinCenter+awaybin+expandBin];
        cueBin2=setdiff(cue2Bin,removeBin);

            %amplitude: per cell
            for ii=1:length(cells);%every cell
                f=useDfof(ii,:);
                % cueBin1=usePeakBins{ii}{cue1};
                % cueBin2=usePeakBins{ii}{cue2};
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
    for m=1:length(allDistancesNIGroupWithCueBin);%every distance 
        % ampDiffNIMean{m}={};
        % ampDiffNIPeak{m}={};
        for i=1:size(allDistancesNIGroupWithCueBin{m},1); %every cue pairs in ths distance
            % ampDiffNIMean{m}{i}=[];
            % ampDiffNIPeak{m}{i}=[];
            % cue1=allDistancesNIGroup{m}(i,1);
            % cue2=allDistancesNIGroup{m}(i,2);

        cue1BinCenter=ceil(sum(allDistancesNIGroupWithCueBin{m}(i,[5 6]))/2)-1;
        removeBin=[cue1BinCenter-awaybin+1:cue1BinCenter+awaybin];
        cue1Bin=[cue1BinCenter-awaybin-expandBin+1:cue1BinCenter+awaybin+expandBin];
        cueBin1=setdiff(cue1Bin,removeBin);
  cue2BinCenter=ceil(sum(allDistancesNIGroupWithCueBin{m}(i,[7 8]))/2)-1;
        removeBin=[cue2BinCenter-awaybin+1:cue2BinCenter+awaybin];
        cue2Bin=[cue2BinCenter-awaybin-expandBin+1:cue2BinCenter+awaybin+expandBin];
        cueBin2=setdiff(cue2Bin,removeBin);

            for ii=1:length(cells);%every cell
                f=useDfof(ii,:);
                % cueBin1=usePeakBins{ii}{cue1};
                % cueBin2=usePeakBins{ii}{cue2};
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