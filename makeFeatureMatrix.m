clear all;
close all;
clc;
directory = '..\EMU data\Labeled Data for Use\All_Eat\';


BaseDirectory = '..\EMU data\Labeled Data for Use\';
EatDirectory = strcat(BaseDirectory,'All_Eat\');
TalkDirectory = strcat(BaseDirectory,'All_Talk\');
SleepDirectory = strcat(BaseDirectory,'All_Sleep\');
TechDirectory = strcat(BaseDirectory,'All_Tech\');

EatFeatureMatrix = makeActivityFeatureMatrix(EatDirectory,'eat',1);
TalkFeatureMatrix = makeActivityFeatureMatrix(TalkDirectory,'talk',2);
SleepFeatureMatrix = makeActivityFeatureMatrix(SleepDirectory,'sleep',3);
TechFeatureMatrix = makeActivityFeatureMatrix(TechDirectory,'Tech',4);




 