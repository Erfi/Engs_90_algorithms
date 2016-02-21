%last modified: Feb 15 2016 by Erfan Azad
%========================================
function [ epochData ] = epochify( timeSeries, duration, SR)
%timeSeries: a two column matrix of times and values
%duration: duration of an epoch in seconds
%SR: Sampling rate
%
%
%OUTPUT: returns an data structure containing the epoch as well as other
%useful informaiton such as start and endtime of an epoch.

numSamplesInDuration = duration*SR;
len = size(timeSeries,1);
numEpoches = floor(len/numSamplesInDuration);

epochData=cell(numEpoches, 4);
for i=1:numEpoches
    epochData{i,1} = i;%epoch number
    epochData{i,2} = timeSeries((i-1)*numSamplesInDuration+1,1);%start time
    epochData{i,3} = timeSeries((i)*numSamplesInDuration+1,1);%end time
    epochData{i,4} = timeSeries((i-1)*numSamplesInDuration+1:(i)*numSamplesInDuration+1,:);% epoch section
end
end

