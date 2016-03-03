%function MIC(filename)

clear; clc; clf;
fs = 50000;
load('Talk_4358_4382_acc_mic.mat');
mic = data(:,4);
N = numel(mic);
t = (0:N-1)/fs;
disp('loading file...done!')

features = mic_extractor (mic, 50000);


% mic_median = median_filter(mic,5000,20);
% [Fx,f] = fft_calc(mic_median,fs);
% 
% disp('median filter...done!')
% wo = 60/(fs/2);  bw = wo/50;
% [b,a] = iirnotch(wo,bw);

mic_blips_removed = remove_noise(mic, 10);

d1 = designfilt('bandstopiir','FilterOrder',4, ...
               'HalfPowerFrequency1',59,'HalfPowerFrequency2',61, ...
               'DesignMethod','butter','SampleRate',fs);

d2 = designfilt('bandstopiir','FilterOrder',4, ...
               'HalfPowerFrequency1',119,'HalfPowerFrequency2',121, ...
               'DesignMethod','butter','SampleRate',fs);
           
d3 = designfilt('bandstopiir','FilterOrder',4, ...
               'HalfPowerFrequency1',179,'HalfPowerFrequency2',181, ...
               'DesignMethod','butter','SampleRate',fs);

d4 = designfilt('bandstopiir','FilterOrder',4, ...
               'HalfPowerFrequency1',239,'HalfPowerFrequency2',241, ...
               'DesignMethod','butter','SampleRate',fs);

d5 = designfilt('bandstopiir','FilterOrder',4, ...
               'HalfPowerFrequency1',299,'HalfPowerFrequency2',301, ...
               'DesignMethod','butter','SampleRate',fs);
           
mic_notch = filtfilt(d1,mic_blips_removed);
mic_notch = filtfilt(d2,mic_notch);
mic_notch = filtfilt(d3,mic_notch);
mic_notch = filtfilt(d4,mic_notch);
mic_notch = filtfilt(d5,mic_notch);


[Fy, f1] = fft_calc(mic_notch,fs);
disp('notch filter...done!')

% mic_noiseremoved = remove_noise(mic_notch,100,0.2);

%[Fx,f] = fft_calc(mic_noiseremoved(7301:14880),fs);
[Fx,f2] = fft_calc(mic,fs);

figure()
subplot(211)
plot(t,mic,'b',t,mic_notch,'r')
xlim([13.75 15.25]);
xlabel('Time (seconds)');
ylabel('Amplitude (mV)');
title('Audio Signal Amplitude Before and After Filtering');
legend('Before Filtering', 'After Filtering');

subplot(212)
semilogx(f1,Fx, 'b',f2,Fy,'r')
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('Frequency Response of Audio Signal Before and After Filtering');
legend('Before Filtering', 'After Filtering');

%semilogx(f,Fx)

% wavwrite(mic_notch,50000,24,'filtered_mic_data');
disp ('File saved!');