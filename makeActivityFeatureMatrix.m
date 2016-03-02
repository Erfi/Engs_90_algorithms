%Erfan Azad
%Date; 1 March 2016
%Description: creates a matrix with features of one epoch at each row

function [ activityFeatureMatrix ] = makeActivityFeatureMatrix( ActDirectory,ActivityTitle, activityLabel )
    %count the number of .mat files in the given directory
    %it has to be an even number
    D = dir([ActDirectory,'*.mat']);
    numFiles = length(D(not([D.isdir])));
    if(mod(numFiles,2) ~= 0)
        error('Number of files in the directory has to be even');
    end
    
    title = ActivityTitle;
    set1 = '_acc_mic';
    set2 = '_eda_emg_ecg';
    extension = '.mat';
    
    
    for i = 1:(numFiles/2)
        filename1 = strcat(ActDirectory,num2str(i),title,set1,extension);
        filename2 = strcat(ActDirectory,num2str(i),title,set2,extension);
        
        dat1 = load(filename1);
        dat1 = dat1.data;
        dat2 = load(filename2);
        dat2 = dat2.data;
        
        featureRow(i,:) = makeFeatureRow(dat1, 50000, dat2, 5000, activityLabel);
    end

    activityFeatureMatrix = featureRow;
end

