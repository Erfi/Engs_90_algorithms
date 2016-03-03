%Erfan Azad
%Date: 1 March 2016
%Description: takes a .mat file re[presenting an acivity and extracts as
%many 10sec epoches from it as possible given its length.
%saves them in a folder

%% for eating1 acc-mic
clear all;
close all;
DirectoryName = 'P:\16winter\engs090\GR 04 Detect Seizures\EMU data\Labeled Data for Use\Session 1\Eating\';
filename = 'Eat_4468_4496_acc_mic.mat';
eat1_acc_mic = load(strcat(DirectoryName, filename));
eat1_acc_mic = eat1_acc_mic.data;

sampleRate = 50000;% sample rate for acc1 acc2 acc3 and mic
numEpoches = floor(size(eat1_acc_mic,1)/(sampleRate*10));% num of 10sec epoches we can get from this .mat file


startInx = 1;
endIndx = sampleRate*10;
for i = 1:numEpoches 
   data = eat1_acc_mic(startInx:endIndx,:);
   save(strcat(DirectoryName, 'eat1_acc_mic_', num2str(i),'.mat'),'data');
   
   %update indecies
   startInx = endIndx+1;
   endIndx = endIndx + (sampleRate*10);
end

%% for eating1 eda-emg-ecg
clear all;
close all;
DirectoryName = 'P:\16winter\engs090\GR 04 Detect Seizures\EMU data\Labeled Data for Use\Session 1\Eating\';
filename = 'Eat_4468_4496_eda_emg_ecg.mat';%<<<<
eat1_eda_emg_ecg = load(strcat(DirectoryName, filename)); %<<<
eat1_eda_emg_ecg =eat1_eda_emg_ecg.data; %<<<

sampleRate = 5000;% sample rate for acc1 acc2 acc3 and mic
numEpoches = floor(size(eat1_eda_emg_ecg,1)/(sampleRate*10));% num of 10sec epoches we can get from this .mat file %<<<<<


startInx = 1;
endIndx = sampleRate*10;
for i = 1:numEpoches
   data = eat1_eda_emg_ecg(startInx:endIndx,:);%<<<<
   save(strcat(DirectoryName, 'eat1_eda_emg_ecg_', num2str(i),'.mat'),'data');
   
   %update indecies
   startInx = endIndx+1;
   endIndx = endIndx + (sampleRate*10);
end

%% for eating2 acc-mic
clear all;
close all;
DirectoryName = 'P:\16winter\engs090\GR 04 Detect Seizures\EMU data\Labeled Data for Use\Session 1\Eating\';
filename = 'Eat_5688_5696_acc_mic.mat';%<<<
eat2_acc_mic = load(strcat(DirectoryName, filename));%<<<
eat2_acc_mic = eat2_acc_mic.data;%<<<

sampleRate = 50000;% sample rate for acc1 acc2 acc3 and mic
numEpoches = floor(size(eat2_acc_mic,1)/(sampleRate*10));% num of 10sec epoches we can get from this .mat file


startInx = 1;
endIndx = sampleRate*10;
for i = 1:numEpoches
   data = eat2_acc_mic(startInx:endIndx,:);
   save(strcat(DirectoryName, 'eat2_acc_mic_', num2str(i),'.mat'),'data');
   
   %update indecies
   startInx = endIndx+1;
   endIndx = endIndx + (sampleRate*10);
end



%% for eating2 eda-emg-ecg
clear all;
close all;
DirectoryName = 'P:\16winter\engs090\GR 04 Detect Seizures\EMU data\Labeled Data for Use\Session 1\Eating\';
filename = 'Eat_5688_5696_eda_emg_ecg.mat';%<<<
eat2_eda_emg_ecg = load(strcat(DirectoryName, filename));%<<<
eat2_eda_emg_ecg = eat2_eda_emg_ecg.data;%<<<

sampleRate = 5000;% sample rate for acc1 acc2 acc3 and mic
numEpoches = floor(size(eat2_eda_emg_ecg,1)/(sampleRate*10));% num of 10sec epoches we can get from this .mat file


startInx = 1;
endIndx = sampleRate*10;
for i = 1:numEpoches
   data = eat2_eda_emg_ecg(startInx:endIndx,:);
   save(strcat(DirectoryName, 'eat2_eda_emg_ecg_', num2str(i),'.mat'),'data');
   
   %update indecies
   startInx = endIndx+1;
   endIndx = endIndx + (sampleRate*10);
end
%% for eating3 acc-mic
clear all;
close all;
DirectoryName = 'P:\16winter\engs090\GR 04 Detect Seizures\EMU data\Labeled Data for Use\Session 2\Eating\';
filename = 'Eat_2826_2836_acc_mic.mat';%<<<
eat3_acc_mic = load(strcat(DirectoryName, filename));%<<<
eat3_acc_mic = eat3_acc_mic.data;%<<<

sampleRate = 50000;% sample rate for acc1 acc2 acc3 and mic
numEpoches = floor(size(eat3_acc_mic,1)/(sampleRate*10));% num of 10sec epoches we can get from this .mat file


startInx = 1;
endIndx = sampleRate*10;
for i = 1:numEpoches
   data = eat3_acc_mic(startInx:endIndx,:);
   save(strcat(DirectoryName, 'eat3_acc_mic_', num2str(i),'.mat'),'data');
   
   %update indecies
   startInx = endIndx+1;
   endIndx = endIndx + (sampleRate*10);
end

%% for eating3 eda-emg-ecg
clear all;
close all;
DirectoryName = 'P:\16winter\engs090\GR 04 Detect Seizures\EMU data\Labeled Data for Use\Session 2\Eating\';
filename = 'Eat_2826_2836_eda_emg_ecg.mat';%<<<
eat3_eda_emg_ecg = load(strcat(DirectoryName, filename));%<<<
eat3_eda_emg_ecg = eat3_eda_emg_ecg.data;%<<<

sampleRate = 5000;% sample rate for acc1 acc2 acc3 and mic
numEpoches = floor(size(eat3_eda_emg_ecg,1)/(sampleRate*10));% num of 10sec epoches we can get from this .mat file


startInx = 1;
endIndx = sampleRate*10;
for i = 1:numEpoches
   data = eat3_eda_emg_ecg(startInx:endIndx,:);
   save(strcat(DirectoryName, 'eat3_eda_emg_ecg_', num2str(i),'.mat'),'data');
   
   %update indecies
   startInx = endIndx+1;
   endIndx = endIndx + (sampleRate*10);
end

%% for eating4 acc-mic
clear all;
close all;
DirectoryName = 'P:\16winter\engs090\GR 04 Detect Seizures\EMU data\Labeled Data for Use\Session 2\Eating\';
filename = 'Eat_3202_3212_acc_mic.mat';%<<<
eat4_acc_mic = load(strcat(DirectoryName, filename));%<<<
eat4_acc_mic = eat4_acc_mic.data;%<<<

sampleRate = 50000;% sample rate for acc1 acc2 acc3 and mic
numEpoches = floor(size(eat4_acc_mic,1)/(sampleRate*10));% num of 10sec epoches we can get from this .mat file


startInx = 1;
endIndx = sampleRate*10;
for i = 1:numEpoches
   data = eat4_acc_mic(startInx:endIndx,:);
   save(strcat(DirectoryName, 'eat4_acc_mic_', num2str(i),'.mat'),'data');
   
   %update indecies
   startInx = endIndx+1;
   endIndx = endIndx + (sampleRate*10);
end

%% for eating4 eda-emg-ecg
clear all;
close all;
DirectoryName = 'P:\16winter\engs090\GR 04 Detect Seizures\EMU data\Labeled Data for Use\Session 2\Eating\';
filename = 'Eat_3202_3212_eda_emg_ecg.mat';%<<<
eat4_eda_emg_ecg = load(strcat(DirectoryName, filename));%<<<
eat4_eda_emg_ecg = eat4_eda_emg_ecg.data;%<<<

sampleRate = 5000;% sample rate for acc1 acc2 acc3 and mic
numEpoches = floor(size(eat4_eda_emg_ecg,1)/(sampleRate*10));% num of 10sec epoches we can get from this .mat file


startInx = 1;
endIndx = sampleRate*10;
for i = 1:numEpoches
   data = eat4_eda_emg_ecg(startInx:endIndx,:);
   save(strcat(DirectoryName, 'eat4_eda_emg_ecg_', num2str(i),'.mat'),'data');
   
   %update indecies
   startInx = endIndx+1;
   endIndx = endIndx + (sampleRate*10);
end

%% for eating5 acc-mic
clear all;
close all;
DirectoryName = 'P:\16winter\engs090\GR 04 Detect Seizures\EMU data\Labeled Data for Use\Session 2\Eating\';
filename = 'Eat_3224_3234_acc_mic.mat';%<<<
eat5_acc_mic = load(strcat(DirectoryName, filename));%<<<
eat5_acc_mic = eat5_acc_mic.data;%<<<

sampleRate = 50000;% sample rate for acc1 acc2 acc3 and mic
numEpoches = floor(size(eat5_acc_mic,1)/(sampleRate*10));% num of 10sec epoches we can get from this .mat file


startInx = 1;
endIndx = sampleRate*10;
for i = 1:numEpoches
   data = eat5_acc_mic(startInx:endIndx,:);
   save(strcat(DirectoryName, 'eat5_acc_mic_', num2str(i),'.mat'),'data');
   
   %update indecies
   startInx = endIndx+1;
   endIndx = endIndx + (sampleRate*10);
end

%% for eating5 eda-emg-ecg
clear all;
close all;
DirectoryName = 'P:\16winter\engs090\GR 04 Detect Seizures\EMU data\Labeled Data for Use\Session 2\Eating\';
filename = 'Eat_3224_3234_eda_emg_ecg.mat';%<<<
eat5_eda_emg_ecg = load(strcat(DirectoryName, filename));%<<<
eat5_eda_emg_ecg = eat5_eda_emg_ecg.data;%<<<

sampleRate = 5000;% sample rate for acc1 acc2 acc3 and mic
numEpoches = floor(size(eat5_eda_emg_ecg,1)/(sampleRate*10));% num of 10sec epoches we can get from this .mat file


startInx = 1;
endIndx = sampleRate*10;
for i = 1:numEpoches
   data = eat5_eda_emg_ecg(startInx:endIndx,:);
   save(strcat(DirectoryName, 'eat5_eda_emg_ecg_', num2str(i),'.mat'),'data');
   
   %update indecies
   startInx = endIndx+1;
   endIndx = endIndx + (sampleRate*10);
end

%% for talking1
clear all;
close all;
DirectoryName = 'P:\16winter\engs090\GR 04 Detect Seizures\EMU data\Labeled Data for Use\Session 1\Talking\';
filename = 'Talk_4358_4382_acc_mic.mat';%<<<
talk1_acc_mic = load(strcat(DirectoryName, filename));%<<<
talk1_acc_mic = talk1_acc_mic.data;%<<<

sampleRate = 50000;% sample rate for acc1 acc2 acc3 and mic
numEpoches = floor(size(talk1_acc_mic,1)/(sampleRate*10));% num of 10sec epoches we can get from this .mat file


startInx = 1;
endIndx = sampleRate*10;
for i = 1:numEpoches
   data = talk1_acc_mic(startInx:endIndx,:);%<<<
   save(strcat(DirectoryName, 'talk1_acc_mic_', num2str(i),'.mat'),'data');%<<<
   
   %update indecies
   startInx = endIndx+1;
   endIndx = endIndx + (sampleRate*10);
end

%% for talking1 eda-emg-ecg
clear all;
close all;
DirectoryName = 'P:\16winter\engs090\GR 04 Detect Seizures\EMU data\Labeled Data for Use\Session 1\Talking\';
filename = 'Talk_4358_4382_eda_emg_ecg.mat';%<<<
talk1_eda_emg_ecg = load(strcat(DirectoryName, filename));%<<<
talk1_eda_emg_ecg = talk1_eda_emg_ecg.data;%<<<

sampleRate = 5000;% sample rate for acc1 acc2 acc3 and mic
numEpoches = floor(size(talk1_eda_emg_ecg,1)/(sampleRate*10));% num of 10sec epoches we can get from this .mat file


startInx = 1;
endIndx = sampleRate*10;
for i = 1:numEpoches
   data = talk1_eda_emg_ecg(startInx:endIndx,:);%<<<
   save(strcat(DirectoryName, 'talk1_eda_emg_ecg_', num2str(i),'.mat'),'data');%<<<
   
   %update indecies
   startInx = endIndx+1;
   endIndx = endIndx + (sampleRate*10);
end

%% for talking2 acc-mic
clear all;
close all;
DirectoryName = 'P:\16winter\engs090\GR 04 Detect Seizures\EMU data\Labeled Data for Use\Session 2\Talking\';
filename = 'Talk_3744_3844_acc_mic.mat';%<<<
talk2_acc_mic = load(strcat(DirectoryName, filename));%<<<
talk2_acc_mic = talk2_acc_mic.data;%<<<

sampleRate = 50000;% sample rate for acc1 acc2 acc3 and mic
numEpoches = floor(size(talk2_acc_mic,1)/(sampleRate*10));% num of 10sec epoches we can get from this .mat file


startInx = 1;
endIndx = sampleRate*10;
for i = 1:numEpoches
   data = talk2_acc_mic(startInx:endIndx,:);%<<<
   save(strcat(DirectoryName, 'talk2_acc_mic_', num2str(i),'.mat'),'data');%<<<
   
   %update indecies
   startInx = endIndx+1;
   endIndx = endIndx + (sampleRate*10);
end

%% for talking2 eda-emg-ecg
clear all;
close all;
DirectoryName = 'P:\16winter\engs090\GR 04 Detect Seizures\EMU data\Labeled Data for Use\Session 2\Talking\';
filename = 'Talk_3744_3844_eda_emg_ecg.mat';%<<<
talk2_eda_emg_ecg = load(strcat(DirectoryName, filename));%<<<
talk2_eda_emg_ecg = talk2_eda_emg_ecg.data;%<<<

sampleRate = 5000;% sample rate for acc1 acc2 acc3 and mic
numEpoches = floor(size(talk2_eda_emg_ecg,1)/(sampleRate*10));% num of 10sec epoches we can get from this .mat file


startInx = 1;
endIndx = sampleRate*10;
for i = 1:numEpoches
   data = talk2_eda_emg_ecg(startInx:endIndx,:);%<<<
   save(strcat(DirectoryName, 'talk2_eda_emg_ecg_', num2str(i),'.mat'),'data');%<<<
   
   %update indecies
   startInx = endIndx+1;
   endIndx = endIndx + (sampleRate*10);
end
%% for sleeping1 acc-mic
clear all;
close all;
DirectoryName = 'P:\16winter\engs090\GR 04 Detect Seizures\EMU data\Labeled Data for Use\Session 1\Sleep\';
filename = 'Sleep_26082_26102_acc_mic.mat';%<<<
sleep1_acc_mic = load(strcat(DirectoryName, filename));%<<<
sleep1_acc_mic = sleep1_acc_mic.data;%<<<

sampleRate = 50000;% sample rate for acc1 acc2 acc3 and mic
numEpoches = floor(size(sleep1_acc_mic,1)/(sampleRate*10));% num of 10sec epoches we can get from this .mat file


startInx = 1;
endIndx = sampleRate*10;
for i = 1:numEpoches
   data = sleep1_acc_mic(startInx:endIndx,:);%<<<
   save(strcat(DirectoryName, 'sleep1_acc_mic_', num2str(i),'.mat'),'data');%<<<
   
   %update indecies
   startInx = endIndx+1;
   endIndx = endIndx + (sampleRate*10);
end

%% for sleeping1 eda-emg-ecg
clear all;
close all;
DirectoryName = 'P:\16winter\engs090\GR 04 Detect Seizures\EMU data\Labeled Data for Use\Session 1\Sleep\';
filename = 'Sleep_26082_26102_eda_emg_ecg.mat';%<<<
sleep1_eda_emg_ecg = load(strcat(DirectoryName, filename));%<<<
sleep1_eda_emg_ecg = sleep1_eda_emg_ecg.data;%<<<

sampleRate = 5000;% sample rate for acc1 acc2 acc3 and mic
numEpoches = floor(size(sleep1_eda_emg_ecg,1)/(sampleRate*10));% num of 10sec epoches we can get from this .mat file


startInx = 1;
endIndx = sampleRate*10;
for i = 1:numEpoches
   data = sleep1_eda_emg_ecg(startInx:endIndx,:);%<<<
   save(strcat(DirectoryName, 'sleep1_eda_emg_ecg_', num2str(i),'.mat'),'data');%<<<
   
   %update indecies
   startInx = endIndx+1;
   endIndx = endIndx + (sampleRate*10);
end

%% for sleeping2 acc-mic
clear all;
close all;
DirectoryName = 'P:\16winter\engs090\GR 04 Detect Seizures\EMU data\Labeled Data for Use\Session 1\Sleep\';
filename = 'LongSleep1_acc_mic.mat';%<<<
sleep2_acc_mic = load(strcat(DirectoryName, filename));%<<<
sleep2_acc_mic = sleep2_acc_mic.data;%<<<

sampleRate = 50000;% sample rate for acc1 acc2 acc3 and mic
numEpoches = floor(size(sleep2_acc_mic,1)/(sampleRate*10));% num of 10sec epoches we can get from this .mat file


startInx = 1;
endIndx = sampleRate*10;
for i = 1:numEpoches
   data = sleep2_acc_mic(startInx:endIndx,:);%<<<
   save(strcat(DirectoryName, 'sleep2_acc_mic_', num2str(i),'.mat'),'data');%<<<
   
   %update indecies
   startInx = endIndx+1;
   endIndx = endIndx + (sampleRate*10);
end

%% for sleeping2 eda-emg-ecg
clear all;
close all;
DirectoryName = 'P:\16winter\engs090\GR 04 Detect Seizures\EMU data\Labeled Data for Use\Session 1\Sleep\';
filename = 'LongSleep1_eda_emg_ecg.mat';%<<<
sleep2_eda_emg_ecg = load(strcat(DirectoryName, filename));%<<<
sleep2_eda_emg_ecg = sleep2_eda_emg_ecg.data;%<<<

sampleRate = 5000;% sample rate for acc1 acc2 acc3 and mic
numEpoches = floor(size(sleep2_eda_emg_ecg,1)/(sampleRate*10));% num of 10sec epoches we can get from this .mat file


startInx = 1;
endIndx = sampleRate*10;
for i = 1:numEpoches
   data = sleep2_eda_emg_ecg(startInx:endIndx,:);%<<<
   save(strcat(DirectoryName, 'sleep2_eda_emg_ecg_', num2str(i),'.mat'),'data');%<<<
   
   %update indecies
   startInx = endIndx+1;
   endIndx = endIndx + (sampleRate*10);
end



%% for tech1 acc-mic
clear all;
close all;
DirectoryName = 'P:\16winter\engs090\GR 04 Detect Seizures\EMU data\Labeled Data for Use\Session 1\Technology\';
filename = 'Tech_520_651_acc_mic.mat';%<<<
Tech1_acc_mic = load(strcat(DirectoryName, filename));%<<<
Tech1_acc_mic = Tech1_acc_mic.data;%<<<

sampleRate = 50000;% sample rate for acc1 acc2 acc3 and mic
numEpoches = floor(size(Tech1_acc_mic,1)/(sampleRate*10));% num of 10sec epoches we can get from this .mat file


startInx = 1;
endIndx = sampleRate*10;
for i = 1:numEpoches
   data = Tech1_acc_mic(startInx:endIndx,:);%<<<
   save(strcat(DirectoryName, 'Tech1_acc_mic_', num2str(i),'.mat'),'data');%<<<
   
   %update indecies
   startInx = endIndx+1;
   endIndx = endIndx + (sampleRate*10);
end


%% for tech1 eda_emg_ecg
clear all;
close all;
DirectoryName = 'P:\16winter\engs090\GR 04 Detect Seizures\EMU data\Labeled Data for Use\Session 1\Technology\';
filename = 'Tech_520_651_eda_emg_ecg.mat';%<<<
Tech1_eda_emg_ecg = load(strcat(DirectoryName, filename));%<<<
Tech1_eda_emg_ecg = Tech1_eda_emg_ecg.data;%<<<

sampleRate = 5000;% sample rate for acc1 acc2 acc3 and mic
numEpoches = floor(size(Tech1_eda_emg_ecg,1)/(sampleRate*10));% num of 10sec epoches we can get from this .mat file


startInx = 1;
endIndx = sampleRate*10;
for i = 1:numEpoches
   data = Tech1_eda_emg_ecg(startInx:endIndx,:);%<<<
   save(strcat(DirectoryName, 'Tech1_eda_emg_ecg_', num2str(i),'.mat'),'data');%<<<
   
   %update indecies
   startInx = endIndx+1;
   endIndx = endIndx + (sampleRate*10);
end
%% for tech2 acc-mic
clear all;
close all;
DirectoryName = 'P:\16winter\engs090\GR 04 Detect Seizures\EMU data\Labeled Data for Use\Session 1\Technology\';
filename = 'Tech_4402_4458_acc_mic.mat';%<<<
Tech2_acc_mic = load(strcat(DirectoryName, filename));%<<<
Tech2_acc_mic = Tech2_acc_mic.data;%<<<

sampleRate = 50000;% sample rate for acc1 acc2 acc3 and mic
numEpoches = floor(size(Tech2_acc_mic,1)/(sampleRate*10));% num of 10sec epoches we can get from this .mat file


startInx = 1;
endIndx = sampleRate*10;
for i = 1:numEpoches
   data = Tech2_acc_mic(startInx:endIndx,:);%<<<
   save(strcat(DirectoryName, 'Tech2_acc_mic_', num2str(i),'.mat'),'data');%<<<
   
   %update indecies
   startInx = endIndx+1;
   endIndx = endIndx + (sampleRate*10);
end
%% for tech2 eda-emg-ecg
clear all;
close all;
DirectoryName = 'P:\16winter\engs090\GR 04 Detect Seizures\EMU data\Labeled Data for Use\Session 1\Technology\';
filename = 'Tech_4402_4458_eda_emg_ecg.mat';%<<<
Tech2_eda_emg_ecg = load(strcat(DirectoryName, filename));%<<<
Tech2_eda_emg_ecg = Tech2_eda_emg_ecg.data;%<<<

sampleRate = 5000;% sample rate for acc1 acc2 acc3 and mic
numEpoches = floor(size(Tech2_eda_emg_ecg,1)/(sampleRate*10));% num of 10sec epoches we can get from this .mat file %<<<


startInx = 1;
endIndx = sampleRate*10;
for i = 1:numEpoches
   data = Tech2_eda_emg_ecg(startInx:endIndx,:);%<<<
   save(strcat(DirectoryName, 'Tech2_eda_emg_ecg_', num2str(i),'.mat'),'data');%<<<
   
   %update indecies
   startInx = endIndx+1;
   endIndx = endIndx + (sampleRate*10);
end

%% for seizure1 acc-mic
clear all;
close all;
DirectoryName = 'P:\16winter\engs090\GR 04 Detect Seizures\EMU data\Labeled Data for Use\';
filename = 'patient4a_acc_mic_8334_8396.mat';%<<<
Tech2_acc_mic = load(strcat(DirectoryName, filename));%<<<
Tech2_acc_mic = Tech2_acc_mic.data;%<<<

sampleRate = 50000;% sample rate for acc1 acc2 acc3 and mic
numEpoches = floor(size(Tech2_acc_mic,1)/(sampleRate*10));% num of 10sec epoches we can get from this .mat file


startInx = 1;
endIndx = sampleRate*10;
for i = 1:numEpoches
   data = Tech2_acc_mic(startInx:endIndx,:);%<<<
   save(strcat(DirectoryName,'All_Seizure\',num2str(i),'seizure_acc_mic','.mat'),'data');%<<<
   
   %update indecies
   startInx = endIndx+1;
   endIndx = endIndx + (sampleRate*10);
end

%% for seizure1 eda-emg-ecg
clear all;
close all;
DirectoryName = 'P:\16winter\engs090\GR 04 Detect Seizures\EMU data\Labeled Data for Use\';
filename = 'patient4a_eda_emg_ecg_8334_8396.mat';%<<<
Tech2_eda_emg_ecg = load(strcat(DirectoryName, filename));%<<<
Tech2_eda_emg_ecg = Tech2_eda_emg_ecg.data;%<<<

sampleRate = 5000;% sample rate for acc1 acc2 acc3 and mic
numEpoches = floor(size(Tech2_eda_emg_ecg,1)/(sampleRate*10));% num of 10sec epoches we can get from this .mat file %<<<


startInx = 1;
endIndx = sampleRate*10;
for i = 1:numEpoches
   data = Tech2_eda_emg_ecg(startInx:endIndx,:);%<<<
   save(strcat(DirectoryName,'All_Seizure\',num2str(i),'seizure_eda_emg_ecg','.mat'),'data');%<<<
   
   %update indecies
   startInx = endIndx+1;
   endIndx = endIndx + (sampleRate*10);
end

%% for seizure2 acc-mic
clear all;
close all;
DirectoryName = 'P:\16winter\engs090\GR 04 Detect Seizures\EMU data\Labeled Data for Use\';
filename = 'Patient 4\Seizure\seizure1_acc_mic.mat';%<<<
acc_mic = load(strcat(DirectoryName, filename));%<<<
acc_mic = acc_mic.data;%<<<

sampleRate = 50000;% sample rate for acc1 acc2 acc3 and mic
numEpoches = floor(size(acc_mic,1)/(sampleRate*10));% num of 10sec epoches we can get from this .mat file


startInx = 1;
endIndx = sampleRate*10;
for i = 1:numEpoches
   data = acc_mic(startInx:endIndx,:);%<<<
   save(strcat(DirectoryName,'All_Seizure\',num2str(i+6),'seizure_acc_mic','.mat'),'data');%<<<
   
   %update indecies
   startInx = endIndx+1;
   endIndx = endIndx + (sampleRate*10);
end

%% for seizure2 eda-emg-ecg
clear all;
close all;
DirectoryName = 'P:\16winter\engs090\GR 04 Detect Seizures\EMU data\Labeled Data for Use\';
filename = 'Patient 4\Seizure\seizure1_eda_emg_ecg.mat';%<<<
Tech2_eda_emg_ecg = load(strcat(DirectoryName, filename));%<<<
Tech2_eda_emg_ecg = Tech2_eda_emg_ecg.data;%<<<

sampleRate = 5000;% sample rate for acc1 acc2 acc3 and mic
numEpoches = floor(size(Tech2_eda_emg_ecg,1)/(sampleRate*10));% num of 10sec epoches we can get from this .mat file %<<<


startInx = 1;
endIndx = sampleRate*10;
for i = 1:numEpoches
   data = Tech2_eda_emg_ecg(startInx:endIndx,:);%<<<
   save(strcat(DirectoryName,'All_Seizure\',num2str(i+6),'seizure_eda_emg_ecg','.mat'),'data');%<<<
   
   %update indecies
   startInx = endIndx+1;
   endIndx = endIndx + (sampleRate*10);
end

%% for unlabeled1 acc-mic
clear all;
close all;
DirectoryName = 'P:\16winter\engs090\GR 04 Detect Seizures\EMU data\Labeled Data for Use\';
filename = 'patient4a_acc_mic_2700_2760.mat';%<<<
acc_mic = load(strcat(DirectoryName, filename));%<<<
acc_mic = acc_mic.data;%<<<

sampleRate = 50000;% sample rate for acc1 acc2 acc3 and mic
numEpoches = floor(size(acc_mic,1)/(sampleRate*10));% num of 10sec epoches we can get from this .mat file


startInx = 1;
endIndx = sampleRate*10;
for i = 1:numEpoches
   data = acc_mic(startInx:endIndx,:);%<<<
   save(strcat(DirectoryName,'All_Unlabeled\',num2str(i),'unlabeled_acc_mic','.mat'),'data');%<<<
   
   %update indecies
   startInx = endIndx+1;
   endIndx = endIndx + (sampleRate*10);
end

%% for unlabeled1 eda-emg-ecg
clear all;
close all;
DirectoryName = 'P:\16winter\engs090\GR 04 Detect Seizures\EMU data\Labeled Data for Use\';
filename = 'patient4a_eda_emg_ecg_2700_2760.mat';%<<<
eda_emg_ecg = load(strcat(DirectoryName, filename));%<<<
eda_emg_ecg = eda_emg_ecg.data;%<<<

sampleRate = 5000;% sample rate for acc1 acc2 acc3 and mic
numEpoches = floor(size(eda_emg_ecg,1)/(sampleRate*10));% num of 10sec epoches we can get from this .mat file %<<<


startInx = 1;
endIndx = sampleRate*10;
for i = 1:numEpoches
   data = eda_emg_ecg(startInx:endIndx,:);%<<<
   save(strcat(DirectoryName,'All_Unlabeled\',num2str(i),'unlabeled_eda_emg_ecg','.mat'),'data');%<<<
   
   %update indecies
   startInx = endIndx+1;
   endIndx = endIndx + (sampleRate*10);
end

%% for unlabeled2 acc-mic
clear all;
close all;
DirectoryName = 'P:\16winter\engs090\GR 04 Detect Seizures\EMU data\Labeled Data for Use\';
filename = 'Patient 4\Normal\norm1_acc_mic.mat';%<<<
acc_mic = load(strcat(DirectoryName, filename));%<<<
acc_mic = acc_mic.data;%<<<

sampleRate = 50000;% sample rate for acc1 acc2 acc3 and mic
numEpoches = floor(size(acc_mic,1)/(sampleRate*10));% num of 10sec epoches we can get from this .mat file


startInx = 1;
endIndx = sampleRate*10;
for i = 1:numEpoches
   data = acc_mic(startInx:endIndx,:);%<<<
   save(strcat(DirectoryName,'All_Unlabeled\',num2str(i+6),'unlabeled_acc_mic','.mat'),'data');%<<<
   
   %update indecies
   startInx = endIndx+1;
   endIndx = endIndx + (sampleRate*10);
end

%% for unlabeled2 eda-emg-ecg
clear all;
close all;
DirectoryName = 'P:\16winter\engs090\GR 04 Detect Seizures\EMU data\Labeled Data for Use\';
filename = 'Patient 4\Normal\norm1_eda_emg_ecg.mat';%<<<
eda_emg_ecg = load(strcat(DirectoryName, filename));%<<<
eda_emg_ecg = eda_emg_ecg.data;%<<<

sampleRate = 5000;% sample rate for acc1 acc2 acc3 and mic
numEpoches = floor(size(eda_emg_ecg,1)/(sampleRate*10));% num of 10sec epoches we can get from this .mat file %<<<


startInx = 1;
endIndx = sampleRate*10;
for i = 1:numEpoches
   data = eda_emg_ecg(startInx:endIndx,:);%<<<
   save(strcat(DirectoryName,'All_Unlabeled\',num2str(i+6),'unlabeled_eda_emg_ecg','.mat'),'data');%<<<
   
   %update indecies
   startInx = endIndx+1;
   endIndx = endIndx + (sampleRate*10);
end