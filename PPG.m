clear; clc; clf;

load RunTest_Dvij_acc_acc_ppg.mat

fs = 2000;
ppg = data(1:100000,3);
N = numel(ppg);

t = (0:N-1)/fs;
[Fppg,f] = fft_calc(ppg,fs);
[b,a] = butter(6,10/(fs/2));

%b = fir1(500,10/(fs/2));
ppg_filtered = filter(b,a,ppg);
Fppg_filtered = fft_calc(ppg_filtered,fs);

dppg = diff(ppg_filtered);
[Fdppg,f2] = fft_calc(dppg,fs);
figure(1)
subplot(211)
plot(t,ppg/max(ppg),t(1:end-1),dppg/max(dppg))
subplot(212)
semilogx(f,Fppg,f2,Fdppg)