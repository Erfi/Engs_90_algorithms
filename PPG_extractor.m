function feature_vector = PPG_extractor(epoch, fs)% fs is the sampling rate

% time and data vectors
ppg = epoch;
N = numel(ppg);
t = (0:N-1)/fs;

% zero phase filter
[b,a] = butter(3,[1, 50]/(fs/2));
ppg_filtered = filtfilt(b,a,ppg);

% A is the big peak
% B is the following valley
% C is the next peak
% D is the last valley

[peaks, locations] = findpeaks(ppg_filtered);
thresh = 0.5*max(peaks);
A = peaks(peaks>thresh);
A_ind = locations(peaks>thresh);
AA = diff(A_ind);

for i = 1:numel(A)-1

a = A_ind(i); % R1
a2 = A_ind(i+1); 

whole_window = a:a2;

[peakval,peakloc] = findpeaks(ppg_filtered(whole_window));

% find the first detected peak that meets a threshold rise from the minimum
% before it. threshold = 0.01*vertical distance b/w A-peak and minimum
% before it. if no peaks are detected, set the peak to the middle of the
% whole window.
if numel(peakloc) >= 1
	for n = 1:length(peakval)
		b = min(ppg_filtered(a:(peakloc(n)+a)));
		if peakval(n) >= 0.001 * (ppg_filtered(a)-b) + b;
			C(i) = peakval(n);
			C_ind(i) = peakloc(n)+a;
			break
		end
	end
else
	C_ind(i) = (a+a2)/2;
	C(i) = ppg_filtered(C_ind);
end

% if none of the detected peaks meet the threshold, set the peak to the
% middle of the whole window
if length(C_ind) < i
	C_ind(i) = (a+a2)/2;
	C(i) = ppg_filtered(C_ind(i));
	b = min(ppg_filtered(a:C_ind(i)));
end

first_window = a:C_ind(i);
	
B(i) = b;
B_ind(i) = find(ppg_filtered(first_window) == B(i)) + a;

second_window = C_ind(i):a2;

D(i) = min(ppg_filtered(second_window));
D_ind(i) = find(ppg_filtered(second_window) == D(i)) + C_ind(i);


end


for i = 1: numel(A) - 1
	AC_length(i) = C_ind(i) - A_ind(i); 
	AB_height(i) = A(i) - B(i); 
end


% Should corelate with heart rate
AA = diff(A_ind)./fs;
AA_av = mean(AA);
AA_std = std(AA); 

% Systolic peak
A_av = mean(A); 
A_std = std(A); 

B_av = mean(B); 
B_std = std(B);

% Diastolic peak
C_av = mean(C); 
C_std = std(C);

D_av = mean(D); 
D_std = std(D);

% Pulse length
AC_length_av = mean(AC_length)./fs;
AC_length_std = std(AC_length)./fs;

% Related to reflection index
AB_height_av = mean(AB_height);
AB_height_std = std(AB_height);

feature_vector = [AA_av, AA_std, A_av, A_std, B_av, B_std, C_av, C_std, D_av, D_std, AC_length_av, AC_length_std, AB_height_av, AB_height_std];

%Recommendations: 
% How to deal with motion artifacts? 
% Get two-wavelength PPG device for O2 sat calculation (See Pavlova et al)





