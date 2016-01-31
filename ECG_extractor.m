%Erfan Azad
%Date: 30 Jan 2016
%File: ECG_extractor
%Discription: This is a extraction driver designed for feature extraction
%and analysis for the ECG signal
close all;
clear all;

%build a label dictionary
labelKey = {'stand', 'walk', 'slope_walk', 'jog', 'run', 'sprint'};
labelVal = {1,2,3,4,5,6};
labelMap = containers.Map(labelKey, labelVal);

%the number of each activity (in epoches) in the timeline
%[1 20; 2 10] means: activity #1 for 20 epoches, activity#2 for 10 epoches
activity_log = [1 15; 2 15; 4 15; 5 15; 6 15; 2 30; 5 10; 2 20; 5 10; 3 50];

%Translate the ECG data into epoches of 6 sec
ECG_epoch = extractCol('RunTest_Dvij_emg_eda_ecg_acc.mat', 2, 2000, 3);


%label the ECG data
ECG_epoch = putLabel(ECG_epoch, activity_log); 


