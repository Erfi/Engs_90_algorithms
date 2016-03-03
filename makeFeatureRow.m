%Erfan Azad
%Date: 1 March 2016
%Description: This function takes the two parts of an epoch (acc-mic and 
%eda-emg-ecg) and a label and spits out feature row.
%
%INPUT: 
%mat1 : Matrix with columns of: Acc1 - Acc2 - Acc3 - Mic
%mat2 : Matrix with columns of: EDA - EMG - ECG
%label : an iteger representing a label for the activity for this epoch
%sampleRate1: sampleRate for mat1's data
%sampleRate2: sampleRate for mat2's data
%
%OUTPUT:
%featureRow: Row of scarals representing features with the label appended 
%in the end

function [ featureRow ] = makeFeatureRow(mat1,sampleRate1, ...
                                         mat2, sampleRate2, label)
    Tag = label;

    %extract features from each sensor
    emg_feature = EMG_extractor(mat2(:,2), sampleRate2);
    acc_feature = acc_extractor(mat1(:,1), mat1(:,2), mat1(:,3), sampleRate1);
    eda_feature = EDA_extractor(mat2(:,1), sampleRate2);
    ecg_feature = ECG_extractor(mat2(:,3), sampleRate2);
    mic_feature = mic_extractor(mat1(:,4), sampleRate1);
    %HERE ADD MORE SENSOR EXTRACTORS

    %make one row (1xd) from all the extracted features
    %NOTE: Tag must be added last
    featureRow = horzcat(acc_feature, mic_feature, eda_feature, emg_feature, ecg_feature,Tag);
end

    