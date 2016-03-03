  %Erfan Azad
%Date; 1 March 2016
%Description: creates a matrix of one activity with
%features of one epoch at each row

function [ activityFeatureMatrix ] = makeActivityFeatureMatrix( ActDirectory,ActivityTitle, activityLabel, epoch_length )
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
        clear featureRow;
        filename1 = strcat(ActDirectory,num2str(i),title,set1,extension);
        filename2 = strcat(ActDirectory,num2str(i),title,set2,extension);
        
        dat1 = load(filename1);
        dat2 = load(filename2);        
        
        % within each 10 s epoch, make a feature row for each epoch of
        % length "epoch_length" (i.e. 2 epochs if desired length is 5 sec)
        
        for k = 1:(10/epoch_length);
            data1 = dat1.data(1+(k-1)*epoch_length*50000:k*epoch_length*50000,:);
            data2 = dat2.data(1+(k-1)*epoch_length*5000:k*epoch_length*5000,:);
            
            featureRow(k,:) = makeFeatureRow(data1, 50000, data2, 5000, activityLabel);
        end
        
        if i == 1
            epochfeature = featureRow;
        else
            epochfeature = vertcat(epochfeature,featureRow);
        end
        
    end

    activityFeatureMatrix = epochfeature;
end

