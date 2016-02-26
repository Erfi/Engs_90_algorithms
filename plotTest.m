raw1 = load('data/raw/patient1a_acc_acc_acc_mic_45_60_min.mat');
raw1 = raw1.data;
subplot(4,1,1);
plot(raw1(:,1));
subplot(4,1,2);
plot(raw1(:,2));
subplot(4,1,3);
plot(raw1(:,3));
subplot(4,1,4);
plot(raw1(:,4));

figure;

down1 = load('data/down_sampled/DOWN_patient1a_acc_acc_acc_mic_45_60_min.mat');
down1 = down1.data;
subplot(4,1,1);
plot(down1(:,1));
subplot(4,1,2);
plot(down1(:,2));
subplot(4,1,3);
plot(down1(:,3));
subplot(4,1,4);
plot(down1(:,4));


