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

% make data vectors
N = numel (epoch);
t =(1:N)./fs; 

% Filter epoch
[b,a] = butter(2,[0.5 150]/(fs/2));
bpf_y = filtfilt(b, a, epoch);

% Fourier Transform stuff
[FT, f] = fft_calc (bpf_y, fs);

% Compute features
emg_IEMG = sum (abs(bpf_y)); % Integrated EMG
emg_MAV  = emg_IEMG/ numel(bpf_y); % Mean Absolute Value
emg_variance = var(bpf_y);
emg_rootmean = rms(bpf_y);
emg_waveform_length = sum (abs(diff(bpf_y)));
emg_max_peak = max(findpeaks(bpf_y));
emg_time_high = 0; 
for i = 1: numel(bpf_y)
	if bpf_y (i) > 0.75*emg_max_peak
		emg_time_high = emg_time_high + 1; 
	end
end
emg_time_high = emg_time_high/ numel(bpf_y); 
% crossings = find_zeros2(t, epoch); % takes too much time!
% zero_crossings = numel (crossings);

emg_mean_FT = mean(FT); % measure of power

emg_spectral_centroid = dot (FT, f) / sum (f);

feature_vector = [emg_MAV, emg_variance, emg_rootmean, emg_waveform_length,...
	emg_max_peak, emg_time_high, emg_mean_FT, emg_spectral_centroid];

end
