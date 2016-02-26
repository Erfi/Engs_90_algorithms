function [v_mag,v,r,t_window] = ACC_extractor(filename1,filename2,time,window_time)

fs = 2000;                     % Hz
Acc1 = load(filename1);
Acc1 = Acc1.data;
Acc2 = load(filename2);
Acc2 = Acc2.data;

length1 = length(Acc1);
length2 = length(Acc2);
use_length = min(length1, length2);     % cut x, y, and z vectors to same size

Acc(:,1) = Acc1(1:use_length,4);
Acc(:,2) = Acc2(1:use_length,1);
Acc(:,3) = Acc2(1:use_length,2);

t = (1:length(Acc1))/fs;

start_time = time(1);                         % user-defined, units = seconds
start_time = start_time*fs + 1;    % time --> index in time vector
end_time = time(2);                          % user-defined, units = seconds
end_time = end_time*fs;        % time --> index in time vector
                            
test_acc = Acc(start_time:end_time, :);      
test_t = t(start_time:end_time);

x = test_acc(:,1);
y = test_acc(:,2);
z = test_acc(:,3);
acc_mag = sqrt(x.^2+y.^2+z.^2);

% Use 5 second windows
n = fs*window_time; % number of points per window
k = 1;
for i = 1:n:numel(x)-n
    x_window = x(i:i+n);
    y_window = y(i:i+n);
    z_window = z(i:i+n);

    acc_mag_window = acc_mag(i:i+n);

    v(k,:) = [var(x_window), var(y_window), var(z_window)];
    r(k,:) = [corr(x_window,y_window), corr(x_window,z_window), corr(y_window,z_window)];
    v_mag(k) = var(acc_mag_window);
    t_window(k) = test_t(i);
    k = k + 1;
end

plot(test_t,acc_mag)