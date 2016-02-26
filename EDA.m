% Latika Sridhar on Feb 16th 2016
% This code takes an epoch of EDA data and extracts various features 

% The code:
%
% 1. Passes the signal through a low pass filter of cutoff frequency = 1 hz
% 2. Finds the average, std, and max peak-to-peak amplitudes
% 3. Finds the average, std, and max time between consecutive peaks
% 4. Finds the average, std, and max time between consecitive valleys
% 5. Finds the max positive slope and its index within the epoch
% 6. Plots the filtered data, the peaks and valleys, and the location of
% max slope
% 7. Finds length of curve in the epoch


% TO DO: 
% 
% 1. Output the data as a vector in a larger feature extraction code
% 2. Only return these features if the data shows that the # of peaks and
% valleys is normal (no error in detecting extrema) - if statement is there
% just needs to return the vector
% 

% Load data
clear; clc; clf;
load('Saaid_fs2000.mat');
fs = 2000; 

%% Create test data vector
start_time = 60000;
end_time = start_time + 10 * fs-1;   % user-defined, change # for time duration
y = data(start_time:end_time,2);                % EDA signal, microsiemens
t = 1/fs*(start_time:end_time);
N = numel(t);
f = fs/N:fs/N:fs/2;

% Low-pass FIR filter
bpf_y = filter (fir1(1000, 2/fs), 1, y);
temp = fft(bpf_y);
Fbpfy = 20*log10(abs(temp(1:N/2)));

% Find peaks
[peaks, maxlocations] = findpeaks(bpf_y);
maxtimes = (maxlocations+start_time)/fs;
 
% Find valleys

[valleys, minlocations] = findpeaks(-bpf_y);
valleys = -1*valleys;
mintimes = (minlocations+start_time)/fs;

deriv = diff(bpf_y);                        % slope of line

lmin = length(minlocations);
lmax = length(maxlocations);

exmalocations(1:lmin) = minlocations;
exmalocations((lmin+1):(lmin+lmax)) = maxlocations;
exmalocations = sort(exmalocations);

pkpk = zeros((length(exmalocations)-1),1);         % initialize pk-pk vector

if abs(lmin-lmax) == 1 || abs(lmin-lmax) == 0
    for n = 2:length(exmalocations)
        pkpk(n-1) = abs(bpf_y(exmalocations(n))-bpf_y(exmalocations(n-1)));
    end
    
    avgpkpk = mean(pkpk);                   % average pk-pk amplitudes
    stdpkpk = std(pkpk);                    % standard deviation of pk-pk amps
    maxpkpk = max(pkpk);
    peakdiff = diff(maxtimes);              % time between peaks
    avgpeakdiff = max(peakdiff);            % average time between peaks
    stdpeakdiff = std(peakdiff);            % standard deviation of time between peaks
    mindiff = diff(mintimes);               % time between valleys
    avgmindiff = max(mindiff);              % average time between valleys
    stdmindiff = std(mindiff);              % standard deviation of time between valleys
    maxpeakdiff = max(peakdiff);
    maxderiv = max(deriv)/(1/fs);           % max slope of a response
    maxderivloc = find(deriv == max(deriv));   % index of max derivative
end

len = 0;                                    % initialize length of curve in epoch

for n = 1:length(deriv)
    len = len + sqrt((deriv(n))^2 + (1/fs)^2);
end

subplot(211)
plot(t,y)
subplot(212)
plot(t,bpf_y);
hold on
plot(mintimes,bpf_y(minlocations),'rx');
plot(maxtimes,bpf_y(maxlocations),'go');
plot((maxderivloc+start_time)/fs, bpf_y(maxderivloc),'ro')
hold off