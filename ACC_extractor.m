function feature_vector = acc_extractor (acc_x_epoch, acc_y_epoch, acc_z_epoch, fs)

% Each epoch must be the same size

[b,a] = butter(6,100/(fs/2));

x = filtfilt(b,a,acc_x_epoch);
y = filtfilt(b,a,acc_y_epoch);
z = filtfilt(b,a,acc_z_epoch);

t = (1:numel(acc_x_epoch))./fs;

acc_mag = sqrt(x.^2+y.^2+z.^2);

[FT_mag,f] = fft_calc(acc_mag,fs);

% Use 1/5 second windows
T = 1/5; 
n = fs*T; % number of points per window
k = 1;

for i = 1:n:numel(x)-n
    x_window = x(i:i+n);
    y_window = y(i:i+n);
    z_window = z(i:i+n);

    acc_mag_window = acc_mag(i:i+n);
    acc_filtered_window = acc_mag(i:i+n);

    v(k,:) = [var(x_window), var(y_window), var(z_window)];
    r(k,:) = [corr(x_window,y_window), corr(x_window,z_window), corr(y_window,z_window)];
    v_mag(k) = var(acc_mag_window);
    t_window(k) = t(i);
    k = k + 1;
end

acc_mag_av = mean (acc_mag);
acc_mag_std = std (acc_mag);
acc_mag_max = max (acc_mag);

acc_FT_mag_av = mean (FT_mag); % indication of the power of the wave 

acc_xy_corr_mean = mean (r(1,:));
acc_xz_corr_mean = mean (r(2,:));
acc_yz_corr_mean = mean (r(3,:));

acc_xy_corr_std = std (r(1,:));
acc_xz_corr_std = std (r(2,:));
acc_yz_corr_std = std (r(3,:));

acc_spectral_centroid = dot (FT_mag, f) / sum (f);

thresh = 0.9 * acc_mag_max; 

total = 0; 
for i = 1 : numel (acc_mag)
	if (acc_mag(i) > thresh)
		total = total + 1;
	end
end

acc_high_mag_time = total / fs; %can reveal twitches (if low)

feature_vector = [acc_mag_av, acc_mag_std, acc_mag_max, acc_FT_mag_av,...
					acc_xy_corr_mean, acc_xz_corr_mean, acc_yz_corr_mean,...
					acc_xy_corr_std, acc_xz_corr_std, acc_yz_corr_std, ...
					acc_high_mag_time, acc_spectral_centroid];
