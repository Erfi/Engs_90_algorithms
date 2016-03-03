
epoch = ECG.data(1:5000*5,3);
fs = 5000;

% Create time vector 
t = (1:numel(epoch))./fs;
N = numel(t);

% Bandpass IIR zero-phase filter
[b,a] = butter(2,[0.5 100]/(fs/2));
bpf_y = filtfilt(b, a, epoch);
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
bpf_y = filtfilt (d1, bpf_y);
bpf_y = filtfilt (d2, bpf_y);
bpf_y = filtfilt (d3, bpf_y);
bpf_y = filtfilt (d4, bpf_y);
bpf_y = filtfilt (d5, bpf_y);

% temp = fft(bpf_y);
% FT = 20*log10(abs(temp(1:N/2)));

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

for i = 1: (numel(P_start)-2)%-2 is a hack to get it going. It was giving index out of bound for T_end(i) 
	P_length(i) = P_end(i) - P_start(i);
	T_length(i) = T_end(i) - T_start(i); 
	ST_length(i) = T_ind(i) - S_ind(i); %TO DO: look for ST elevation/ depression
	PR_length(i) = R_ind(i+1) - P_ind(i); %can tell us about PAD and AV block
	RT_length(i) = R_ind(i+1) - T_ind(i); %can tell us about PVC
	RS_height(i) = R(i)-S(i);
	
	if (i ~= numel(P_start)) %deal with indexing
		QRS_length(i) = S_ind(i+1)-Q_ind(i);
	end
	
	STval_local_average(i) = 0; 
	for j = S_ind(i): T_ind(i)
		STval_local_average(i) = STval_local_average(i) + bpf_y(j);
	end
	STval_local_average(i) = STval_local_average(i)/ (T_ind(i) - S_ind(i));	
end

%RR length 
RR_length_av = mean(RR./fs);
RR_length_std = std(RR./fs);

%P height 
P_height_av = mean (P);
P_height_std = std(P);

%P length 
P_length_av = mean (P_length./fs);
P_length_std = std(P_length./fs);

%T Height 
T_height_av = mean (T);
T_height_std = std(T);

%T length 
T_length_av = mean (T_length./fs);
T_length_std = std(T_length./fs);

%RS height 
RS_height_av = mean(RS_height);
RS_height_std = std(RS_height);

%QRS length 
QRS_length_av = mean(QRS_length./fs);
QRS_length_std = std(QRS_length./fs);

%PR length 
PR_length_av = mean(PR_length./fs);
PR_length_std = std(PR_length./fs);

%ST length 
ST_length_av = mean(ST_length./fs);
ST_length_std = std(ST_length./fs);

%ST height 
ST_height_av = mean (STval_local_average);
ST_height_std = std (STval_local_average); % high s tandard deviation is bad!  

%Average Heart rate in bpm
HR_av_bpm = 60/ RR_length_av;

% Plotting
%Plot 1: Plot the ECG signal with features labeled
figure(1)
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
