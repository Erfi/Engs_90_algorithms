%Erfan Azad
%Date: 2 March 2016
%Description: Plots the dual histofram of both activity 1 and 2 on the 
%same plot
%
%INPUT:
%CHI: Vector of of values corresponding to both activity one and two
%activitySplitIndex: last index (row) of activity1 in CHI
%lowRange: low range of the plot
%highRange: high range of the plot
%binsize: size of the bins between low and high range
%act1Name: name of activity1 (to be used in the plot)
%act2Name: name of activity2 (to be used in the plot)
%
%OUTPUT: Dual histogram plot (no actual return value)


function plotDualHistogram( CHI, activitySplitIndex, lowRange, highRange, binsize, act1Name, act2Name )
    %=====HISTOGRAM=====
    binSize = binsize;
    numBins = lowRange:binSize:highRange;
    h1 = histogram(CHI(1:activitySplitIndex),numBins,'Normalization', 'pdf');
    set(h1, 'FaceColor','r');
    pd1 = fitdist(CHI(1:activitySplitIndex),'normal');
   
    hold on;
    h2 = histogram(CHI(activitySplitIndex+1:end),numBins, 'Normalization', 'pdf');
    set(h2, 'FaceColor','b');
    pd2 = fitdist(CHI(activitySplitIndex+1:end),'normal');
    hold on;
    %==================
    
    %======plot normal distribution======
    n1 = normpdf(numBins,pd1.mu,pd1.sigma);
    n2 = normpdf(numBins,pd2.mu,pd2.sigma);
    plot(numBins, n1,'r','LineWidth',2);
    hold on;
    plot(numBins, n2 ,'b','LineWidth',2);
    legend(act1Name, act2Name);
    hold off;
    %===================================
end

