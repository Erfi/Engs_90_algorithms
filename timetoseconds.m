% Latika Sridhar
% Time conversion to seconds from start of event

% Define time matrix
% Replace all ":" with space using crtl+F

T = [03 37 25
02 06 20
02 06 35
02 21 58
03 36 50 
03 37 10
03 37 26
03 38 15
03 46 02
04 36 05
04 37 33
04 39 32
04 41 49
05 02 25
05 10 31
05 52 09
06 28 36
06 30 22
06 30 31
06 54 25
07 01 30
07 05 30
07 24 00];

T(:,1) = T(:,1) * 3600;
T(:,2) = T(:,2) * 60;
time_sec = [T(:,1)+T(:,2)+T(:,3)];

% Define start time of recording
% Replace ":" with space

start = [20 22 08];
start_sec = start(1)*3600+start(2)*60+start(3);

time_diff = zeros(length(time_sec),1);

% for times in the same day that the system was started
% for i = 1:length(time_sec)
%     time_diff(i) = time_sec(i)-start_sec;
% end

% for times in the day after system was started
time_diff = time_sec + 24*60*60-start_sec;




