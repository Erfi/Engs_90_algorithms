directory = 'P:\16winter\engs090\GR 04 Detect Seizures\EMU data\Labeled Data for Use\All_Eat\';
eat1_1 = load(strcat(directory,'eat1_acc_mic_1.mat'));
eat1_1 = eat1_1.data;
eat1_2 = load(strcat(directory,'eat1_eda_emg_ecg_1.mat'));
eat1_2 = eat1_2.data;

%plot((eat1_2(:,3)));
ecg_feature = ECG_extractor(eat1_2(:,3), 5000);

%pass each signal through feature extraction functions to get their feature arrays