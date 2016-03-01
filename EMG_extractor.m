% EMG feature extractor
% Dvij Bajpai on Feb 16th 2016
% Last Edited Feb 21st 2016 by Dvij Bajpai

% This code extracts the following features from an epoch 
% 1. Mean Absolute Value 
% 2. Variance 
% 3. Root mean square 
% 4. Waveform length
% 5. Max peak 
% 6. Wilson Amplitude 
% 7. Number of zero crossings
% 8. Mean of the fourier transform 
% 9. Standard deviation of the fourier transform 

% Epochs can be around a second long, but longer if we can learn about
% wavelet transforms

% Useful Papers: 
% 1. Surface EMG signal processing and classification techniques by 
% Chowdhury 

% TO DO: 
% 1. Research the possibility of using wavelet transforms to filter and 
% interpret data
% 2. Look up log detector from Chowdhury
% 3. Think about filtering

function feature_vector = EMG_extractor(epoch, fs)

% Filter epoch
% Low-pass FIR filter
% epoch = filter(fir1(100, 150/(fs/2)), 1, epoch);
t =(1:numel(epoch))./fs; 

% Fourier Transform stuff
N = numel(t);
f = fs/N:fs/N:fs/2;
temp = fft(epoch);
FT = 20*log10(abs(temp(1:N/2)));

% Compute features
IEMG = sum (abs(epoch)); % Integrated EMG
MAV  = IEMG/ numel(epoch); % Mean Absolute Value
variance = var(epoch);
rootmean = rms(epoch);
waveform_length = sum (abs(diff(epoch)));
max_peak = max(findpeaks(epoch));
wilson_amplitude = 0; 
for i = 1: numel(epoch)
	if epoch (i) > 0.75*max_peak
		wilson_amplitude = wilson_amplitude + 1; 
	end
end
wilson_amplitude = wilson_amplitude/ numel(epoch); 
crossings = find_zeros2(t, epoch); 
zero_crossings = numel (crossings);

mean_FT = mean(FT);
std_FT = std(FT);

feature_vector = [MAV, variance, rootmean, waveform_length, max_peak, wilson_amplitude, zero_crossings, mean_FT, std_FT];