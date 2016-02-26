%function MIC(filename)
fs = 50000;
load('microphone.mat');
mic = mic(100000:200000);
N = numel(mic);
t = (0:N-1)/fs;
disp('loading file...done!')

mic_median = median_filter(mic,1000,11);
%[Fx,f] = fft_calc(mic_median,fs);

disp('median filter...done!')
wo = 150/(fs/2);  bw = wo/50;
[b,a] = iirnotch(wo,bw);

mic_notch = filter(b,a,mic_median);
%Fy = fft_calc(mic_notch,fs);
disp('notch filter...done!')


mic_noiseremoved = remove_noise(mic_notch,100,0.2);

%[Fx,f] = fft_calc(mic_noiseremoved(7301:14880),fs);
%[Fx,f] = fft_calc(mic_noiseremoved(22060:29630),fs);

figure(1)
subplot(211)
plot(t,mic,t,mic_noiseremoved)
subplot(212)
%semilogx(f,Fx,f,Fy)
semilogx(f,Fx)