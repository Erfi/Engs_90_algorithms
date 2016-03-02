
% Test EDA Extractor

% EDA = load('Talk_4358_4382_eda_emg_ecg.mat');
EDA = load('Tech_9728_10820_eda_emg_ecg.mat');
fs = 1/(EDA.isi/1000);
feature = EDA_extractor (EDA.data(1:50000,1), fs)
t = (1:numel (EDA.data(:,1)))./fs;
y = EDA.data(:,1);
