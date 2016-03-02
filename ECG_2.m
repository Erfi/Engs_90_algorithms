% Tyler Ray, Dvij Bajpai, and Latika Sridhar on Feb 14th 2016
% Last Edited Feb 15th 2016 by Dvij Bajpai (Extensive edits)
% This code takes an epoch of ECG data and analyzes the signal between the 
% first and last R peaks in the epoch. 

% The code
% 1. Labels P, Q, R, S, and T between two RR intervals and stores the time stamps 
%    in vectors called P_ind, Q_ind, R_ind, S_ind, and T_ind
% 2. Finds the average heart rate and average XX intervals (X = P,Q,R,S,T)
% 3. Finds the average P wave length (IMPORTANT TO NOTE DEFINITIONS of P_start AND P_end)
% 4. Finds the average T wave length (IMPORTANT TO NOTE DEFINITIONS of T_start AND T_end)
% 5. Finds the average QRS complex length 

% Irregularities noted in Zijlmans et al.: 
% Heart Rate Abnormalities: 
% 1. Tachycardia (> 100 bpm)
% 2. Brachycardia (< 60 bpm)
% 3. Asystole (extended period with no pulse, up to 30s)
% 4. Premature Arterial Depolarization (PAD/APD)
% 5. Premature Ventricular Depolarization (PVC)
% 6. Sinus pause and sinus arrhythmia
% Conduction Abnormalities:
% 7. First and Second degree Atrio-Ventricular (AV) block 
% 8. Bundle branch block 
% Repolarization abnormalities (potentially serious): 
% 9. T wave inversion 
% 10. ST elevation and depression 

% Other irregularities noted in Opherk et al.: 
% 1. Atrial Bigeminy 
% 2. Ventricular Couplets 

% TO DO: 
% 
% 1. Improve ST elevation and depression and ST length calculations (currently looking at 
%	 standard deviation of local STval averages)
% 2. Think of how to detect Premature Arterial Depolarization (PAD/APD)
%	 Currently using PR segment length.
% 3. Think of how to detect Premature Ventricular Depolarization (PVC)
%	 Currently using RT segment length.
% 4. Think of ways to detect T wave inversion 

% Load data
clear; clc; clf;
data = load('P:\16winter\engs090\GR 04 Detect Seizures\EMU data\Labeled Data for Use\All_Eat\1eat_eda_emg_ecg.mat');
sampling_rate = 5000; 


% Create test data vector
start_time = 1;
end_time = 5 * sampling_rate;
y = ECG(start_time:end_time);
t = t(start_time:end_time);
N = numel(t);
f = fs/N:fs/N:fs/2;

% Low-pass FIR filter
bpf_y = filter(fir1(100, 150/(fs/2)), 1, y);
temp = fft(bpf_y);
Fbpfy = 20*log10(abs(temp(1:N/2)));

% Differentiate data twice
% dydt_bpf = diff(bpf_y);
% crossings = find_zeros2(t,dydt_bpf);
% dydt2 = diff(dydt_bpf);

% Find R-peaks
[peaks, locations] = findpeaks(bpf_y);
th = 0.75*max(peaks);
R = peaks(peaks>th);
R_ind = locations(peaks>th);

% Find RR intervals (samples between consecutive R peaks)
RR = diff(R_ind);

% Find P Q S T peaks and valleys
for i = 1:numel(R)-1
	
    a = R_ind(i); % R1
    b = floor(R_ind(i) + RR(i)/2); % (R2-R1) / 2
    c = R_ind(i+1); % R3

	first_half = bpf_y(a+1:b);
	second_half = bpf_y(b:c-1);
	
	S(i) = min(first_half);
	S_ind(i) = a + find(first_half==S(i));
	
	Q(i) = min(second_half);
	Q_ind(i) = b + find(second_half==Q(i));	
	
	T(i) = max (bpf_y(S_ind(i):b));
	T_ind(i) = a + find(first_half==T(i));	
	
	P(i) = max (bpf_y(b:Q_ind(i)));
	P_ind(i) = b + find(second_half==P(i));
	
	for j = S_ind(i) : T_ind(i)
		if sign (bpf_y(j)) ~= sign(bpf_y(j+1))
			T_start(i) = j;
		end
	end
	
		for j = T_ind(i) : b
		if sign (bpf_y(j)) ~= sign(bpf_y(j+1))
			T_end(i) = j;
		end
	end
	
	for j = b : P_ind(i)
		if sign (bpf_y(j)) ~= sign(bpf_y(j+1))
			P_start(i) = j;
		end
	end
	
		for j = P_ind(i) : Q_ind(i)
		if sign (bpf_y(j)) ~= sign(bpf_y(j+1))
			P_end(i) = j;
		end
	end
	
end

% Plotting
%Plot 1: Plot the ECG signal with features labeled
figure(1)
subplot(211)
plot(t,bpf_y)
hold on
hline(0)

plot(t(R_ind), bpf_y(R_ind), 'rx')
plot(t(S_ind), bpf_y(S_ind), 'go')
plot(t(Q_ind), bpf_y(Q_ind), 'bo')
plot(t(T_ind), bpf_y(T_ind), 'gx')
plot(t(P_ind), bpf_y(P_ind), 'bx')
plot(t(T_start), bpf_y(T_start), 'kx')
plot(t(T_end), bpf_y(T_end), 'kx')
plot(t(P_start), bpf_y(P_start), 'kx')
plot(t(P_end), bpf_y(P_end), 'kx')

% Plot all zero crossings
% for i = 1:numel(crossings)
% 	vline(crossings(i))
% end
% Plot the derivative
%plot(t(1:N-1), dydt_bpf/max(dydt_bpf),'r--')
hold off

% Plot the Fourier Transform
subplot(212)
semilogx(f, Fbpfy)

% Find XX intervals (X = P, Q, S, T; RR already done)
PP = diff(P_ind);
QQ = diff(Q_ind);
SS = diff(S_ind);
TT = diff(T_ind);

% Find average XX interval & heart rate 
PP_average = (1/sampling_rate) * (sum(PP) / numel(PP)); %in seconds
QQ_average = (1/sampling_rate) * (sum(QQ) / numel(QQ)); %in seconds
RR_average = (1/sampling_rate) * (sum(RR) / numel(RR)); %in seconds
SS_average = (1/sampling_rate) * (sum(SS) / numel(SS)); %in seconds
TT_average = (1/sampling_rate) * (sum(TT) / numel(TT)); %in seconds

heart_rate_average = 60 / RR_average; %in beats per minute

for i = 1: numel(P_start)
	P_length(i) = P_end(i) - P_start(i);
	T_length(i) = T_end(i) - T_start(i); 
	ST_length(i) = T_ind(i) - S_ind(i); %TO DO: look for ST elevation/ depression
	PR_length(i) = R_ind(i+1) - P_ind(i); %can tell us about PAD and AV block
	RT_length(i) = R_ind(i+1) - T_ind(i); %can tell us about PVC
	
	STval_local_average(i) = 0; 
	for j = S_ind(i): T_ind(i)
		STval_local_average(i) = STval_local_average(i) + bpf_y(j);
	end
	STval_local_average(i) = STval_local_average(i)/ (T_ind(i) - S_ind(i));	
end

% Find average P length and T length
P_length_average = (1/sampling_rate) * (sum(P_length) / numel(P_length)) %in seconds
T_length_average = (1/sampling_rate) * (sum(T_length) / numel(T_length)) %in seconds

% Find STval total average and standard deviation 
STval_average = mean (STval_local_average)
STval_stdev = std (STval_local_average) % high standard deviation is bad!  

