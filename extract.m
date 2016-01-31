function [ epoch ] = extract( filename, epochLength, sampleRate )
%This function is the first step.
%It takes the filename and returns a matrix of epoches with
%desired epoch length given the sample rate.

raw = load(filename);
data = raw.data;
numPoints = sampleRate * epochLength;
epoch = {};


for(i = 1:size(data,2))
   start = 1; %used to set the start of data range for each epoch
   finish = numPoints; %same as bove but for the end of the range
   epochNumber = 1;
   while(finish < size(data, 1))
       epoch{epochNumber,i} = data(start:finish, i);
       start = finish;
       finish = finish + numPoints;
       epochNumber = epochNumber + 1;
   end
end
end