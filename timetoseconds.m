% Latika Sridhar
% Time conversion to seconds from start of event

% Define time matrix
% Replace all ":" with space using crtl+F

T = [23 08 22 
23 11 12 
23 12 39 
23 13 30 
23 15 46 
23 16 17 
23 16 21 
23 16 35 
23 16 44 
23 17 00 
23 17 23 
23 18 00 
23 19 20 
23 20 12 
23 20 59 
23 23 00 ];

T(:,1) = T(:,1) * 3600;
T(:,2) = T(:,2) * 60;
time_sec = [T(:,1)+T(:,2)+T(:,3)];

% Define start time of recording
% Replace ":" with space

start = [18 47 00];
start_sec = start(1)*3600+start(2)*60+start(3);

time_diff = zeros(length(time_sec),1);

for i = 1:length(time_sec)
    time_diff(i) = time_sec(i)-start_sec;
end





