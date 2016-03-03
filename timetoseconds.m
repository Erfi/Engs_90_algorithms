% Latika Sridhar
% Time conversion to seconds from start of event

% Define time matrix
% Replace all ":" with space using crtl+F

T = [00 35 00
01 03 48
02 49 27
03 20 03
03 49 03
04 52 24
05 53 57 
05 54 24
06 38 53
07 37 27
08 02 00
];

T(:,1) = T(:,1) * 3600;
T(:,2) = T(:,2) * 60;
time_sec = [T(:,1)+T(:,2)+T(:,3)];

% Define start time of recording
% Replace ":" with space

start = [20 08 05];
start_sec = start(1)*3600+start(2)*60+start(3);

time_diff = zeros(length(time_sec),1);

% for times in the same day that the system was started
% for i = 1:length(time_sec)
%     time_diff(i) = time_sec(i)-start_sec;
% end

% for times in the day after system was started
time_diff = time_sec + 24*60*60-start_sec;




