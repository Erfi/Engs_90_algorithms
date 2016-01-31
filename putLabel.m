function [ labeled ] = putLabel( epoch, log )
%This function takes in a cellMatrix of epoches with each column
%representing a sensor and adds an extra column in the end which 
%represents the label for each epoch.

%NOTE: The number or labels should be equal (or less than) the number of
%actual epoches.
%If the number of labels are less than the number of epoches the rest of
%the epoches will be cut off!

numActivities = size(log,1); %number of tasks performed
numSensors = size(epoch,2);
current = 1; %current index
for i = 1:numActivities
    for j = 1:log(i,2)
        epoch{current, numSensors+1} = log(i,1);
        current = current+1;
    end
end
labeled = epoch(1:current-1,:);
end

