%last modified: Feb 15 2016 by Erfan Azad
%========================================
close all;
clear all;

%----------GLOBALS----------
SR = 2000; %sampling rate per second
%------END OF GLOBALS-------

raw1 = load('RunTest_Dvij_acc_acc_ppg.mat');
raw2 = load('RunTest_Dvij_emg_eda_ecg_acc.mat');
raw1 = raw1.data;
raw2 = raw2.data;

[ACCX_data, ACCY_data, PPG_data] = splitCols(raw1);
[EMG_data, EDA_data, ECG_data, ACCZ_data] = splitCols(raw2);

[ACCX_data, ACCY_data, PPG_data,EMG_data, EDA_data, ECG_data, ACCZ_data]...
= make_TimeSeries(...
SR,ACCX_data, ACCY_data, PPG_data,EMG_data,EDA_data, ECG_data, ACCZ_data);

ACCX_epoch = epochify(ACCX_data, 6, SR);
ACCY_epoch = epochify(ACCY_data, 6, SR);
ACCZ_epoch = epochify(ACCZ_data, 6, SR);
EMG_epoch = epochify(EMG_data, 6, SR);
PPG_epoch = epochify(PPG_data, 6, SR);
EDA_epoch = epochify(EDA_data, 6, SR);
ECG_epoch = epochify(ECG_data, 6, SR);

%=====Sample Plot of ECG at epoch 60====
plot(ECG_epoch{60,4}(:,1),ECG_epoch{60,4}(:,2))