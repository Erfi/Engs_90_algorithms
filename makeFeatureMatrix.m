clear all;
close all;
clc;


BaseDirectory = '..\EMU data\Labeled Data for Use\';
EatDirectory = strcat(BaseDirectory,'All_Eat\');
TalkDirectory = strcat(BaseDirectory,'All_Talk\');
SleepDirectory = strcat(BaseDirectory,'All_Sleep\');
TechDirectory = strcat(BaseDirectory,'All_Tech\');

epoch_length = 5;       % define # seconds

EatFeatureMatrix = makeActivityFeatureMatrix(EatDirectory,'eat',1, epoch_length);
TalkFeatureMatrix = makeActivityFeatureMatrix(TalkDirectory,'talk',2, epoch_length);
SleepFeatureMatrix = makeActivityFeatureMatrix(SleepDirectory,'sleep',3, epoch_length);
TechFeatureMatrix = makeActivityFeatureMatrix(TechDirectory,'Tech',4, epoch_length);

%plot histogram
u = LinearDiscriminantTransform(SleepFeatureMatrix, TalkFeatureMatrix);




 