% EMG Analysis
% Dvij Bajpai on Feb 16th 2016
% Last Edited Feb 21st 2016 by Dvij Bajpai

% This code extracts the following features from an epoch 
% 1. Mean Absolute Value 
% 2. Variance 
% 3. Root mean square 
% 4. Wilson Amplitude 
% 5. 

% Epochs can be around a second long, but longer if we can learn about
% wavelet transforms

% Useful Papers: 
% 1. Surface EMG signal processing and classification techniques by 
% Chowdhury 

% TO DO: 
% 1. Research the possibility of using wavelet transforms to filter and 
% interpret data


% Load data
clear; clc; clf; 
load ('Saaid_fs2000');

% NOTE: 3:00 to 3:30 we had 5 sec isometric tension followed by 5s rest
% From 250 to 320 s we had the finger tapping test

% Create test data vector
start_tension = 180*fs + 1;
end_tension = 185*fs;

start_rest = 186*fs + 1;
end_rest = 190*fs;

y_tension = EMG(start_tension:end_tension);
y_rest = EMG(start_rest:end_rest);
t=(1:numel(EMG))./fs; 

t_tension = t(start_tension:end_tension);
t_rest = t(start_rest:end_rest);

N_tension = numel(t_tension);
f_tension = fs/N_tension:fs/N_tension:fs/2;
N_rest = numel(t_rest);
f_rest = fs/N_rest:fs/N_rest:fs/2;

% Low-pass FIR filter
lpf_tension = y_tension;
lpf_rest = y_rest; 

%Compute Fourier Transform for magnitude Bode Plot
temp = fft(lpf_tension);
temp2 = fft(lpf_rest);
FT_tension = 20*log10(abs(temp(1:N_tension/2)));
FT_rest = 20*log10(abs(temp2(1:N_rest/2)));

% Plotting
figure(1)
subplot(211)
plot(t_tension,lpf_tension,t_rest,lpf_rest)
ylim([-1 1])
grid on;


subplot(212)
semilogx(f_tension, FT_tension,f_rest, FT_rest) 
ylim([-51 51])
grid on;

%
% DFT_tension = zeros(numel(f_tension), 2);
% DFT_rest = zeros(numel(f_rest), 2);
% 
% DFT_tension (:,1) = f_tension;
% DFT_tension (:,2) = FT_tension;
% 
% DFT_rest (:,1) = f_rest;
% DFT_rest (:,2) = FT_rest;
% 
% for i = 1:10
% 	tension_bar(i) = mean (FT_tension(((i-1)*500 + 1):i*500)) + 60;
% 	rest_bar(i) =  mean (FT_rest(((i-1)*400 + 1):i*400)) + 60;
% end
% 
% x = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000];
% 
% figure(2);
% subplot(121);
% bar(x, tension_bar);
% ylim([-10, 100])
% hold on
% hline (mean (tension_bar))
% hline (mean (tension_bar) + std(tension_bar))
% hline (mean (tension_bar) - std(tension_bar))
% hold off 
% subplot(122);
% bar(x, rest_bar);
% ylim([-10, 100])
% hold on
% hline (mean (rest_bar))
% hline (mean (rest_bar) + std(rest_bar))
% hline (mean (rest_bar) - std(rest_bar))
% hold off 
% 
% subplot(413)
% 

% subplot(212)
% lev = 13;
% wname = 'sym2';
% nbcol = 64;
% [c,l] = wavedec(y_tension,lev,wname);


% len = length(y_tension);
% cfd = zeros(lev,len);
% for k = 1:lev
%     d = detcoef(c,l,k);
%     d = d(:)';
%     d = d(ones(1,2^k),:);
%     cfd(k,:) = wkeep1(d(:)',len);
% end
% cfd =  cfd(:);
% I = find(abs(cfd)<sqrt(eps));
% cfd(I) = zeros(size(I));
% cfd = reshape(cfd,lev,len);
% cfd = wcodemat(cfd,nbcol,'row');
% 
% colormap(pink(nbcol));
% image(cfd);
% tics = 1:lev;
% labs = int2str((1:lev)');
% ax = gca;
% ax.YTickLabelMode = 'manual';
% ax.YDir = 'normal';
% ax.Box = 'On';
% ax.YTick = tics;
% ax.YTickLabel = labs;
% title('Discrete Wavelet Transform, Absolute Coefficients.');
% xlabel('Time');
% ylabel('Level');

% 
% subplot(414)
% 
% lev = 13;
% wname = 'sym2';
% nbcol = 64;
% [c,l] = wavedec(y_rest,lev,wname);
% 
% 
% len = length(y_rest);
% cfd = zeros(lev,len);
% for k = 1:lev
%     d = detcoef(c,l,k);
%     d = d(:)';
%     d = d(ones(1,2^k),:);
%     cfd(k,:) = wkeep1(d(:)',len);
% end
% cfd =  cfd(:);
% I = find(abs(cfd)<sqrt(eps));
% cfd(I) = zeros(size(I));
% cfd = reshape(cfd,lev,len);
% cfd = wcodemat(cfd,nbcol,'row');
% 
% colormap(pink(nbcol));
% image(cfd);
% tics = 1:lev;
% labs = int2str((1:lev)');
% ax = gca;
% ax.YTickLabelMode = 'manual';
% ax.YDir = 'normal';
% ax.Box = 'On';
% ax.YTick = tics;
% ax.YTickLabel = labs;
% title('Discrete Wavelet Transform, Absolute Coefficients.');
% xlabel('Time');
% ylabel('Level');

% epoch = y_tension; 
% 
% 
% IEMG = sum (abs(epoch)); % Integrated EMG
% MAV  = IEMG/ numel(epoch); % Mean Absolute Value
% variance = var(epoch);
% rootmean = rms(epoch);
% waveform_length = sum (abs(diff(epoch)));
% max_peak = max(findpeaks(epoch));
% 
% wilson_amplitude = 0; 
% for i = 1: numel(epoch)
% 	if epoch (i) > 0.75*max_peak
% 		wilson_amplitude = wilson_amplitude + 1; 
% 	end
% end
% wilson_amplitude = wilson_amplitude/ numel(epoch); 
% % log detector? 
% 
% crossings = find_zeros2(epoch); 
% zero_crossings = numel (crossings);

% figure()
% xdMODWT = wden(epoch,'modwtsqtwolog','s','mln',4,'sym4');
% figure;
% plot(epoch,'r')
% hold on;
% plot(xdMODWT)
% legend('Original Signal','Denoised Signal','Location','NorthEastOutside')
% axis tight;
% hold off;



% CODE TO LOAD, DECIMATE, AND SAVE DATA
% clear; clc; clf;
% X = load('Saaid_test.mat');
% all_sensors = X.data;
% Saaid_ECG = all_sensors(:,1);
% Saaid_EMG = all_sensors(:,2);
% Saaid_EDA = all_sensors(:,3);
% Saaid_mic = all_sensors(:,4);
% 
% ECG = decimate (Saaid_ECG, 10, 'fir');
% EMG = decimate (Saaid_EMG, 10, 'fir');
% EDA = decimate (Saaid_EDA, 10, 'fir');
% mic = decimate (Saaid_mic, 10, 'fir');
% fs = 2000; %sampling rate
% 
% save ('Saaid_fs2000', 'ECG', 'EMG', 'EDA', 'mic', 'fs');

feature_vector_tension = EMG_extractor(y_tension, 2000);
feature_vector_rest = EMG_extractor(y_rest, 2000);
