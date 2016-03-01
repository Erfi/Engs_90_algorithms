function [ noisy_ECG ] = ECG_Noise( ECG )
%adds noise to ECG data for testing purposes

%creating power line noise (60Hz)

sampling_frequency = 2000;
mains_coeff = 0.1;    %Amplitude of mains line to change. Depends on your ECG signal.
time_step = 1/sampling_frequency;
max_time = length(ECG)/sampling_frequency;    % Duration of your signal in seconds.
t = time_step:time_step:max_time;    % This is our time vector.
mains_signal = mains_coeff * cos(2*pi*60*t);       % 60Hz mains frequency. Depends.

noisy_ECG = ECG + mains_signal;


end

