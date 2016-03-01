% Latika Sridhar on Feb 16th 2016
% This code takes an epoch of EDA data and extracts various features 

% The code:
%
% 1. Passes the signal through a low pass filter of cutoff frequency = 35 hz
% 2. Finds the average, std, and max peak-to-peak amplitudes
% 3. Finds the average, std, and max time between consecutive peaks
% 4. Finds the average, std, and max time between consecitive valleys
% 5. Finds the max positive slope and its index within the epoch
% 6. Plots the filtered data, the peaks and valleys, and the location of
% max slope
% 7. Finds length of curve in the epoch
% 8. Standardizes amplitude data by square root transformation
% 9. Only reports extrema that exceed a threshold of 0.01 us
% 10. Calculates length of the waveform in this epoch

% PAPERS:
% http://onlinelibrary.wiley.com/doi/10.1111/j.1528-1167.2012.03444.x/full
%           ten second epochs for EDA, assign each epoch to seizure or not
% http://www.birmingham.ac.uk/Documents/college-les/psych/saal/guide-electrodermal-activity.pdf
%           threshold for event-related response = 0.04 or 0.01 us
%           apply square root transformation to amplitude to standardize
%           low pass at 35 Hz


% TO DO: 
% 
% 1. Output the data as a vector in a larger feature extraction code
% 2. 
% 

% Load data
clear; clc; clf;
load('patient1a_eda_ppg_emg_ecg_360_375_min.mat');
fs = 20000; 

%% Create test data vector
start_time = 60000*50;
end_time = start_time + 10 * fs-1;   % user-defined, change # for time duration
y = data(start_time:end_time,2);                % EDA signal, microsiemens
t = 1/fs*(start_time:end_time);
N = numel(t);
f = fs/N:fs/N:fs/2;

% Low-pass FIR filter
[b, a] = butter (2, [0.01 35]/(fs/2));
filtered_eda = filtfilt (b,a,y);
temp = fft(filtered_eda);
Fbpfy = 20*log10(abs(temp(1:N/2)));

% Find peaks
[peaks, maxlocations] = findpeaks(filtered_eda);
 
% Find valleys

[valleys, minlocations] = findpeaks(-filtered_eda);
valleys = -1*valleys;

deriv = diff(filtered_eda);                        % slope of line

lmin = length(minlocations);
lmax = length(maxlocations);

exmalocations(1:lmin) = minlocations;
exmalocations((lmin+1):(lmin+lmax)) = maxlocations;
exmalocations = sort(exmalocations);

% remove extrema that don't meet 0.01 us threshold  
removeidx = [];

for n = 2:length(exmalocations)
    if abs(filtered_eda(exmalocations(n))-filtered_eda(exmalocations(n -1))) < 0.01
        removeidx(end+1) = n;
    end
end

minlocations = setdiff(minlocations,exmalocations(removeidx));
maxlocations = setdiff(maxlocations,exmalocations(removeidx));
mintimes = (minlocations+start_time)/fs;
maxtimes = (maxlocations+start_time)/fs;

lmin = length(minlocations);
lmax = length(maxlocations);

exmalocations = setdiff(exmalocations,exmalocations(removeidx));

pkpk = zeros((length(exmalocations)-1),1);         % initialize pk-pk vector

    for n = 2:length(exmalocations)
        pkpk(n-1) = abs(filtered_eda(exmalocations(n))-filtered_eda(exmalocations(n-1)));
    end
    
avgpkpk = mean(pkpk);             % average pk-pk amplitudes
stdpkpk = std(pkpk);              % standard deviation of pk-pk amps
maxpkpk = max(pkpk);
peakdiff = diff(maxtimes);              % time between peaks
avgpeakdiff = max(peakdiff);            % average time between peaks
stdpeakdiff = std(peakdiff);            % standard deviation of time between peaks
mindiff = diff(mintimes);               % time between valleys
avgmindiff = max(mindiff);              % average time between valleys
stdmindiff = std(mindiff);              % standard deviation of time between valleys
maxderiv = max(deriv)/(1/fs);           % max slope of a response
maxderivloc = find(deriv == max(deriv));   % index of max derivative


len = 0;                                    % initialize length of curve in epoch

for n = 1:length(deriv)
    len = len + sqrt((deriv(n))^2 + (1/fs)^2);
end

subplot(211)
plot(t,y)
subplot(212)
plot(t,filtered_eda);
hold on
plot(mintimes,filtered_eda(minlocations),'rx');
plot(maxtimes,filtered_eda(maxlocations),'go');
plot((maxderivloc+start_time)/fs, filtered_eda(maxderivloc),'ro')
hold off
