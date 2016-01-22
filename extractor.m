close all;

epoch = extract('RunTest_Dvij_acc_acc_ppg.mat', 2, 2000);% keep every epoch as a cell
PSD = average_PSD(epoch);
P2P = peak2peak(epoch);


%=========Labeling PSD data==========
timeFrame = [15,15,15,15,15,30,10,20,10,5,5,5,5,5,5,5,5,5,5];% duration of each task

stand_acc1 = P2P(1:15,1);%1-15
stand_acc2 = P2P(1:15,2);%1-15

walk_acc1 = P2P(16:30,1);%1-15
walk_acc2 = P2P(16:30,2);%1-15

jog_acc1 = P2P(31:45,1);%1-15
jog_acc2 = P2P(31:45,2);%1-15

run_acc1 = P2P(46:60,1);%1-15
run_acc2 = P2P(46:60,2);%1-15

sprint_acc1 = P2P(61:75,1);%1-15
sprint_acc2 = P2P(61:75,2);%1-15

walk_acc1(16:45) = P2P(76:105,1);%16-45
walk_acc2(16:45) = P2P(76:105,2);%16-45

run_acc1(16:25) = P2P(106:115,1);%16-25
run_acc2(16:25) = P2P(106:115,2);%16-25

walk_acc1(46:65) = P2P(116:135,1);%46-65
walk_acc2(46:65) = P2P(116:135,2);%46-65

run_acc1(26:35) = P2P(136:145,1);%46-55
run_acc2(26:35) = P2P(136:145,2);%46-55

walk_slope_acc1 = P2P(146:end,1);
walk_slope_acc2 = P2P(146:end,2);
%======================================
%========Plotting different tasks======

scatter(stand_acc1, stand_acc2, 'fill');
hold on;
scatter(walk_slope_acc1, walk_slope_acc2,'fill');
hold on;
scatter(walk_acc1, walk_acc2,'fill');
hold on;
scatter(run_acc1, run_acc2,'fill');
hold on;
scatter(sprint_acc1, sprint_acc2,'fill');
legend('stand','slope','walk','run','sprint');
title('Peak To Peak Value Of Each Epoch FOR ACCL1 vs. ACCL2');
xlabel('Peak to Peak Accl1');
ylabel('Peak to Peak Accl2');
%=======================================


