%Erfan Azad
%Date: 21 Feb 2016
%Description: This driver is specifically for using the downSample function to down sample
%all the .mat files in a given directory.
%This can be used as part of pre-processing of the data.
%NOTE: For down sampling individual data vector/matrices please use the 
%downSample function.

startTime = 45;%start time of the file (in the file's name)
endTime = 60;% end time of the file (in the file's name)
sensorSet1 = 'acc_acc_acc_mic';
sensorSet2 = 'eda_ppg_emg_ecg';
% >>>>>Change to use different sensor set<<<<<<<<
currentSensorSet = sensorSet1;
baseDirectory = strcat('.',filesep,'data',filesep,'raw',filesep'); %folder/directory that the raw files are in
fileNameTemplate = strcat(baseDirectory, 'patient1a_',currentSensorSet,'_*_*_min.mat'); %template for the raw filenames (Notice: start and end times are replaced with *)
numMatFiles = size(dir(fileNameTemplate),1);% number of files matching the template
success = true;% overall success flag
for i = 1:numMatFiles
    file_name = strcat(baseDirectory,'patient1a_',currentSensorSet,'_',num2str(startTime),'_',num2str(endTime),'_min.mat');
    if exist(file_name, 'file') == 0 % 0 if the file does not exist
        disp(strcat('Nope, File is not there :( --> ', file_name));
        disp('Quitting...');
        success = false;
        break;
    else
        disp(strcat('Down sampling -->  ',file_name));
        raw = load(file_name);
        raw = raw.data;
        savingName = strcat('data',filesep,'down_sampled',filesep,'DOWN_patient1a_',currentSensorSet,'_',num2str(startTime),'_',num2str(endTime),'_min.mat');
        downSample(raw,2000, savingName); 
    end 
    %update start and end time for the next filename
    startTime = endTime;
    endTime = endTime + 15;%HACK: we know that sample names are in 15 min increments!
end

if(success)
   disp('Process completed successfully!'); 
end




