%Erfan Azad
%Date: 28 Feb 2016
%Description: Loads a data set and manually chooses a 10 second portion of it that 
%looks like a standard signal and saves that 10 sec portion for future
%feature extraction analysis. (For FDR!)

raw1 =load('EMu_Data\PatientA\patient1a_acc_acc_acc_mic_360_375_min.mat');
raw2 =load('EMu_Data\PatientA\patient1a_eda_ppg_emg_ecg_360_375_min.mat');

data1=raw1.data;
data2=raw2.data;

acc1_std = data1(10600000:10800000,1);%for acc1
acc2_std = data1(10600000:10800000,2);%for acc2
acc3_std = data1(10600000:10800000,3);%for acc3
mic_std = data1(10600000:10800000,4);% for mic

eda_std = data2(6100000:6300000,1);%for eda
ppg_std = data2(6100000:6300000,2);%for ppg
emg_std = data2(6100000:6300000,3);%for emg
ecg_std = data2(6100000:6300000,4);%for ECG


%=====Uncommnet if you wish to plot each standard epoch chosen above====
% plot(acc1_std);
% title('sample acc1');
% figure;
% plot(acc2_std);
% title('sample acc2');
% figure;
% plot(acc3_std);
% title('sample acc3');
% figure;
% plot(mic_std);
% title('sample mic');
% 
% figure;
% plot(eda_std);
% title('sample eda');
% figure;
% plot(ppg_std);
% title('sample ppg');
% figure;
% plot(emg_std);
% title('sample emg');
% figure;
% plot(ecg_std);
% title('sample ecg');

data=acc1_std;% just so the field name will become 'data'
save('EMU_Data\standard_epoches\acc1_std.mat', 'data');
data=acc2_std;
save('EMU_Data\standard_epoches\acc2_std.mat', 'data');
data=acc3_std;
save('EMU_Data\standard_epoches\acc3_std.mat', 'data');
data=mic_std;
save('EMU_Data\standard_epoches\mic_std.mat', 'data');

data=eda_std;
save('EMU_Data\standard_epoches\eda_std.mat', 'data');
data=ppg_std;
save('EMU_Data\standard_epoches\ppg_std.mat', 'data');
data=emg_std;
save('EMU_Data\standard_epoches\emg_std.mat', 'data');
data=ecg_std;
save('EMU_Data\standard_epoches\ecg_std.mat', 'data');





