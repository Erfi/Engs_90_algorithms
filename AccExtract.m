% Latika Sridhar
% ACC Extractor
% Engs 90 Group 4

close all;
clear all;

sample_rate = 2000;                     % Hz

Acc1 = load('RunTest_Dvij_emg_eda_ecg_acc.mat');
Acc1 = Acc1.data;
Acc2 = load('RunTest_Dvij_acc_acc_ppg.mat');
Acc2 = Acc2.data;

length1 = length(Acc1);
length2 = length(Acc2);
use_length = min(length1, length2);     % cut x, y, and z vectors to same size

ACC(:,1) = Acc1(1:use_length,4);
ACC(:,2) = Acc2(1:use_length,1);
ACC(:,3) = Acc2(1:use_length,2);

t = (1:length(Acc1))/sample_rate;

start_time = 2;                         % user-defined, units = seconds
start_time = start_time*sample_rate;    % time --> index in time vector
end_time = 40;                          % user-defined, units = seconds
end_time = end_time*sample_rate;        % time --> index in time vector

x = 1;
y = 2;
z = 3;

axis = x;                               % user-defined: x, y, or z axis         

test_acc = ACC(start_time:end_time, axis);      
test_t = t(start_time:end_time);

figure();                               % plot single-axis acc vs. time
plot(test_t,test_acc);

acc_mag = sqrt(ACC(:,x).^2+ACC(:,y).^2+ACC(:,z).^2)-9.8;

figure();
plot(test_t,acc_mag(start_time:end_time));

