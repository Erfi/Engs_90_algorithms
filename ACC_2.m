[v_mag,v,r,t_window] = ACC_extractor(,1);

subplot(311)
plot(t_window,v_mag)
subplot(312)
plot(t_window,v)
subplot(313)
plot(t_window,r)

stdev_mag = std(v_mag);
stdev_x = std(v(:,1));
stdev_y = std(v(:,2));
stdev_z = std(v(:,3));
mean_mag = mean(v_mag);
mean_x = mean(v(:,1));
mean_y = mean(v(:,2));
mean_z = mean(v(:,3));
stdev_xy_corr = std(r(:,1));
stdev_xz_corr = std(r(:,2));
stdev_yz_corr = std(r(:,3));
mean_xy_corr = mean(r(:,1));
mean_xz_corr = mean(r(:,2));
mean_yz_corr = mean(r(:,3));
