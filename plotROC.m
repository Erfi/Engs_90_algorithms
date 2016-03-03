%Erfan Azad
%Data: 3 March 2016
%Description: Plots the ROC curve.(Like you couldn't have tell from the name!) 
%
%INPUT: 
%CHI: Correlation vector from linear descriminant transform
%act1Length: length of portion of the CHI vector corresponding to activity1
%act2Length: length of portion of the CHI vector corresponding to activity2
%
%OUTPUT: plots the ROC curve
function [maxAccuracy,maxPercision, Int] = plotROC( CHI, act1Length, act2Length, act1Name, act2Name)
    k=1;
    for th = min(CHI):0.01:max(CHI);
        more = find(CHI>=th);%all indecies of the data that larger than threshold
        lTP = find(more>act1Length);%true positive
        lFP = find(more<=act1Length);%false positive
        less = find(CHI<th);%all indecies of the data that are smaller than threshold
        lTN = find(less<act1Length);%true negative
        lFN = find(less>=act1Length);%false negative
        nTP(k) = length(lTP);
        nFP(k) = length(lFP);
        nTN(k) = length(lTN);
        nFN(k) = length(lFN);
        TPR(k) = nTP(k)/(act2Length);%Sensitivity
        FPR(k) = nFP(k)/(act1Length);%fall-out
        PPV(k) = nTP(k)/(nTP(k)+nFP(k));%percision
        ACC(k) = (nTP(k)+nTN(k))/(nTP(k)+nFP(k)+nFN(k)+nTN(k));%accuracy
        k = k+1;
    end
    maxAccuracy = max(ACC);%maximum accuracy
    maxPercision = max(PPV);%maximum percision
    Int = abs(trapz(FPR,TPR));%area under the curve
    figure;
    plot(FPR,TPR, 'LineWidth' , 2);
    title(['ROC curve of',' ',act1Name,' ','and',' ', act2Name]);
    xlabel('False Positive');
    ylabel('True Positive');
end