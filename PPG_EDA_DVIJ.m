% Dvij Bajpai 
% 31st January 2016
% Code to identify sytolic and diastolic peaks from PPG data

% Load data & create time vector
close all, clear all

sample_rate = 2000; 
A = load('RunTest_Dvij_acc_acc_ppg');
A = A.data;
t=(1:length(A))./sample_rate; 
ppg = t; 
ppg = A(:,3)';

% Create test data vector
start_time = 10000;
end_time = 20000;
test_y = ppg(start_time:end_time)
test_t = t(start_time:end_time)
plot(test_t, test_y);figure(); %PLOT1

% Filter data
test_y = ideal_high_pass (test_y, 2000, 0.5);
%test_y = ideal_low_pass (test_y, 2000, 200);
plot(test_t, test_y);figure(); %PLOT2

derivative = diff(test_y);

window_size = 200;

smooth_derivative = moving_average_filter(derivative, window_size);

crossings = find_zeros (test_t(1:length(test_t) -1), smooth_derivative, 0.00008, sample_rate, 20);
crossings2 = find_zeros2(test_t(1:length(test_t) -1), smooth_derivative);

plot(test_t(1:length(test_t) -1), derivative, test_t(1:length(test_t) -1), smooth_derivative);
hold on;
hline(0);
for i = 1: length(crossings2)
    vline(crossings2(i));
end

hold off; 
figure();

smooth_test_y = moving_average_filter(test_y, window_size);

plot(test_t, smooth_test_y);
hold on;
hline(0);
for i = 1: length(crossings2)
    vline(crossings2(i));
end
