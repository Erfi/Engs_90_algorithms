function feature_vector = EDA_extractor (eda_epoch, fs)

% References:
% http://onlinelibrary.wiley.com/doi/10.1111/j.1528-1167.2012.03444.x/full
%           ten second epochs for EDA, assign each epoch to seizure or not
% http://www.birmingham.ac.uk/Documents/college-les/psych/saal/guide-electrodermal-activity.pdf
%           threshold for event-related response = 0.04 or 0.01 us
%           apply square root transformation to amplitude to standardize
%           low pass at 35 Hz


% maxvalue
% minvalue
% average value
% st dev
% maxderiv
% time high above threshold
% length of wave
% spectral centroid

% Create test data vector                               
t = (1:numel(eda_epoch))./fs;
N = numel(eda_epoch);

% Low-pass IIR filter
[b,a] = butter(4,35/(fs/2));
bpf_y = filtfilt(b, a, eda_epoch);

%Compute FT
[FT, f] = fft_calc (eda_epoch, fs);

% Find features
% maxvalue, minvalue, average value, st dev
eda_max = max (bpf_y);
eda_min = min (bpf_y);
eda_av = mean (bpf_y);
eda_std = std(bpf_y);

%max deriv
eda_max_deriv = max (abs(diff (bpf_y)))/fs; %very small 

%Time high
eda_time_high = 0; %NOTE ADD THIS TO THE RETURNING FEATURES
for i = 1: numel(bpf_y)
	if bpf_y (i) > 0.95*eda_max
		eda_time_high = eda_time_high + 1; 
	end
end
eda_time_high = eda_time_high/ numel(bpf_y); 

eda_signal_length = 0; 
for i = 1: numel (bpf_y) - 1
	eda_signal_length = eda_signal_length + sqrt ((bpf_y(i+1) - bpf_y(i))^2 + (1/fs)^2);
end

eda_spectral_centroid = dot (FT, f) / sum (f);

feature_vector = [eda_max, eda_min, eda_av, eda_std,...
	eda_max_deriv, eda_signal_length, eda_spectral_centroid];
