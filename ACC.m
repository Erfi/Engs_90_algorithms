% Latika Sridhar
% ACC Extractor
% Engs 90 Group 4


clear; clc; clf;


fs = 2000;                     % Hz

Acc1 = load('RunTest_Dvij_emg_eda_ecg_acc.mat');
Acc1 = Acc1.data;
Acc2 = load('RunTest_Dvij_acc_acc_ppg.mat');
Acc2 = Acc2.data;

length1 = length(Acc1);
length2 = length(Acc2);
use_length = min(length1, length2);     % cut x, y, and z vectors to same size

Acc(:,1) = Acc1(1:use_length,4);
Acc(:,2) = Acc2(1:use_length,1);
Acc(:,3) = Acc2(1:use_length,2);

t = (1:length(Acc1))/fs;

start_time = 0;                         % user-defined, units = seconds
start_time = start_time*fs + 1;    % time --> index in time vector
end_time = 300;                          % user-defined, units = seconds
end_time = end_time*fs;        % time --> index in time vector

                            
test_acc = Acc(start_time:end_time, :);      
test_t = t(start_time:end_time);

[b,a] = butter(6,100/(fs/2));
x = test_acc(:,1);
y = test_acc(:,2);
z = test_acc(:,3);
acc_mag = sqrt(x.^2+y.^2+z.^2);

acc_mag = acc_mag-mean(acc_mag);
[FT,f] = fft_calc(acc_mag,fs);

acc_filtered = filter(b,a,acc_mag);
FT_filtered = fft_calc(acc_filtered,fs);

Fx = fft_calc(x,fs);
Fy = fft_calc(y,fs);
Fz = fft_calc(z,fs);

% Use 2 second windows
T = 2;
n = fs*T; % number of points per window

k = 1;
for i = 1:n:numel(x)-n
    x_window = x(i:i+n);
    y_window = y(i:i+n);
    z_window = z(i:i+n);

    acc_mag_window = acc_mag(i:i+n);
    acc_filtered_window = acc_filtered(i:i+n);

    v(k,:) = [var(x_window), var(y_window), var(z_window)];
    r(k,:) = [corr(x_window,y_window), corr(x_window,z_window), corr(y_window,z_window)];
    v_mag(k) = var(acc_mag_window);
    t_window(k) = test_t(i);
    k = k + 1;
end

figure(1)
subplot(211)
plot(test_t,acc_mag,test_t,acc_filtered)
subplot(212)
semilogx(f,FT,f,FT_filtered);

figure(2)
subplot(311)
plot(t_window,v_mag)
subplot(312)
plot(t_window,v)
subplot(313)
plot(t_window,r)
% % Find peaks
% [peaks, maxlocations] = findpeaks(acc_mag);
% maxtimes = maxlocations/fs;
%  
% % Find valleys between peaks
% deriv = diff(acc_mag);
% 
% minlocations = zeros(1,length(deriv));
% 
% for i = 2:length(deriv)
%     if deriv(i) >0
%         if deriv(i-1)< 0
%             minlocations(i) = i;
%         else
%             minlocations(i) = 0;
%         end
%     end
% end
% 
% minlocations = minlocations(minlocations~=0);
% mintimes = minlocations/fs;


feature = acc_extractor (x(1:fs*10), y(1:fs*10), z(1:fs*10), fs)
