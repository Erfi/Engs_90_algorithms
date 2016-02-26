% Latika Sridhar on February 20, 2016
% Code to plot EMU_Data data

% The code

% TO DO



%% Load Data

% Patient 1, 1st session
% Time of possible seizure: 16:00-17:00

A1 = load('.\EMU_Data\PatientA\down_sampled\DOWN_patient1a_acc_acc_acc_mic_330_345_min.mat');
A2 = load('.\EMU_Data\PatientA\down_sampled\DOWN_patient1a_acc_acc_acc_mic_345_360_min.mat');
A3 = load('.\EMU_Data\PatientA\down_sampled\DOWN_patient1a_acc_acc_acc_mic_360_375_min.mat');
A4 = load('.\EMU_Data\PatientA\down_sampled\DOWN_patient1a_acc_acc_acc_mic_375_390_min.mat');
A5 = load('.\EMU_Data\PatientA\down_sampled\DOWN_patient1a_eda_ppg_emg_ecg_330_345_min.mat');
A6 = load('.\EMU_Data\PatientA\down_sampled\DOWN_patient1a_eda_ppg_emg_ecg_345_360_min.mat');
A7 = load('.\EMU_Data\PatientA\down_sampled\DOWN_patient1a_eda_ppg_emg_ecg_360_375_min.mat');
A8 = load('.\EMU_Data\PatientA\down_sampled\DOWN_patient1a_eda_ppg_emg_ecg_375_390_min.mat');


%% Combine data and plot

% Biopac 1 = acc, acc, acc, mic (1,2,3,4)
% Biopac 2 = eda, ppg, emg, ecg (5,6,7,8)

fs = 1000/0.05;
datalength1 = length(A1.data)+length(A2.data)+length(A3.data)+length(A4.data);
datalength2 = length(A5.data)+length(A6.data)+length(A7.data)+length(A8.data);
use_length = min(datalength1, datalength2);

alldata1 = zeros(datalength1,4);
alldata2 = zeros(datalength2,4);

L1 = length(A1.data);                       % indexes of data segments
L2 = L1+length(A2.data);
L3 = L2+length(A3.data);
L4 = L3+length(A4.data);
L5 = length(A5.data);
L6 = L5+length(A6.data);
L7 = L6+length(A7.data);
L8 = L7+length(A8.data);

alldata1(1:L1,:) = A1.data;
alldata1((L1+1):(L2),:) = A2.data;
alldata1((L2+1):(L3),:) = A3.data;
alldata1((L3+1):(L4),:) = A3.data;
alldata2(1:L5,:) = A5.data;
alldata2((L5+1):(L6),:) = A6.data;
alldata2((L6+1):(L7),:) = A7.data;
alldata2((L7+1):(L8),:) = A8.data;

t1 = 1/fs*(1:datalength1);
t2 = 1/fs*(1:datalength2);

% Plot the two biopac datasets

figure(1)

subplot(811)
plot(t1,alldata1(:,1))
ylabel('Accelerometer X')
% xlim([680 850])

subplot(812)
plot(t1,alldata1(:,2))
ylabel('Accelerometer Y')
% xlim([680 850])

subplot(813)
plot(t1,alldata1(:,3))
ylabel('Accelerometer Z')
% xlim([680 850])

subplot(814)
plot(t1,alldata1(:,4))
ylabel('Mic')
% xlim([680 850])

subplot(815)
plot(t2,alldata2(:,1))
ylabel('EDA')
% xlim([680 850])

subplot(816)
plot(t2,alldata2(:,2))
ylabel('PPG')
% xlim([680 850])

subplot(817)
plot(t2,alldata2(:,3))
ylabel('EMG')
% xlim([680 850])

subplot(818)
plot(t2,alldata2(:,4))
ylabel('ECG')
% xlim([680 850])