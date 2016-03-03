close all;
clc;


BaseDirectory = '..\EMU data\Labeled Data for Use\';
EatDirectory = strcat(BaseDirectory,'All_Eat\');
TalkDirectory = strcat(BaseDirectory,'All_Talk\');
SleepDirectory = strcat(BaseDirectory,'All_Sleep\');
TechDirectory = strcat(BaseDirectory,'All_Tech\');
SeizureDirectory = strcat(BaseDirectory,'All_Seizure\');
UnlabeledDirectory = strcat(BaseDirectory,'All_Unlabeled\');

epoch_length = 5;       % define # seconds
makeAll = false;        % set to true to load matrices 

if(makeAll)
    EatFeatureMatrix = makeActivityFeatureMatrix(EatDirectory,'eat',1, epoch_length);
    TalkFeatureMatrix = makeActivityFeatureMatrix(TalkDirectory,'talk',2, epoch_length);
    SleepFeatureMatrix = makeActivityFeatureMatrix(SleepDirectory,'sleep',3, epoch_length);
    TechFeatureMatrix = makeActivityFeatureMatrix(TechDirectory,'Tech',4, epoch_length);
    SeizureFeatureMatrix = makeActivityFeatureMatrix(SeizureDirectory,'seizure',5,epoch_length);
    UnlabeledFeatureMatrix = makeActivityFeatureMatrix(UnlabeledDirectory,'unlabeled',6,epoch_length);
end

%plot histogram and ROC
topFeatures = [];
figure;
[u, maxACC, maxPPV, Integral] = LinearDiscriminantTransform(SleepFeatureMatrix, SeizureFeatureMatrix, 'sleep', 'seizure');
topFeatures = cat(2,topFeatures,u);
fprintf('Sleep vs. Seizure --> Maximum Precision: %.3f  |  Maximum Accuracy: %.3f |  Area Under ROC Curve: %.3f \n',maxPPV,maxACC,Integral);
figure;
[u, maxACC, maxPPV, Integral] = LinearDiscriminantTransform(EatFeatureMatrix, SeizureFeatureMatrix, 'eat', 'seizure');
topFeatures = cat(2,topFeatures,u);
fprintf('Eat vs. Seizure --> Maximum Precision: %.3f  |  Maximum Accuracy: %.3f |  Area Under ROC Curve: %.3f \n',maxPPV,maxACC,Integral);
figure
[u, maxACC, maxPPV, Integral] = LinearDiscriminantTransform(TalkFeatureMatrix, SeizureFeatureMatrix, 'talk', 'seizure');
topFeatures = cat(2,topFeatures,u);
fprintf('Talk vs. Seizure --> Maximum Precision: %.3f  |  Maximum Accuracy: %.3f |  Area Under ROC Curve: %.3f \n',maxPPV,maxACC,Integral);
figure;
[u, maxACC, maxPPV, Integral] = LinearDiscriminantTransform(UnlabeledFeatureMatrix, SeizureFeatureMatrix, 'normal', 'seizure');
topFeatures = cat(2,topFeatures,u);
fprintf('Normal vs. Seizure --> Maximum Precision: %.3f  |  Maximum Accuracy: %.3f |  Area Under ROC Curve: %.3f \n',maxPPV,maxACC,Integral);
figure;
[u, maxACC, maxPPV, Integral] = LinearDiscriminantTransform(TechFeatureMatrix, SeizureFeatureMatrix, 'technology', 'seizure');
topFeatures = cat(2,topFeatures,u);
fprintf('Technology vs. Seizure --> Maximum Precision: %.3f  |  Maximum Accuracy: %.3f |  Area Under ROC Curve: %.3f \n',maxPPV,maxACC,Integral);
figure;
[u, maxACC, maxPPV, Integral] = LinearDiscriminantTransform(vertcat(EatFeatureMatrix,TalkFeatureMatrix,SleepFeatureMatrix,TechFeatureMatrix,UnlabeledFeatureMatrix), SeizureFeatureMatrix, 'non-seizure', 'seizure');
topFeatures = cat(2,topFeatures,u);
fprintf('Non-Seizure vs. Seizure --> Maximum Precision: %.3f  |  Maximum Accuracy: %.3f |  Area Under ROC Curve: %.3f \n',maxPPV,maxACC,Integral);

figure;
sort(topFeatures,'descend')
histogram(topFeatures,53);
title('Histogram of top ten features');


 





 