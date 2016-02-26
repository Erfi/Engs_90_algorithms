[v_mag,v,r,t_window] = ACC_extractor('RunTest_Dvij_emg_eda_ecg_acc.mat','RunTest_Dvij_acc_acc_ppg.mat',[0,300],1);

subplot(311)
plot(t_window,v_mag)
subplot(312)
plot(t_window,v)
subplot(313)
plot(t_window,r)