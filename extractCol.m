function [ epochCol ] = extractCol( filename, epochLength, sampleRate, colNum)
% Similar to extrac() function but for a specific column.
% 
% Input:
% 1)a filename (.mat file) 
% 2)a number representing epochlength (in seconds)
% 3)a number representing samplerate (in Hz)
% 4)column number
% 
% Output:
% A cell matrix with its only column representing the sensor chosen by the
% 4th parameter.
% Each cell contains an array of data corresponding to one 
% epochlength of a time.

raw = load(filename);
data = raw.data;
numPoints = sampleRate * epochLength;
epochCol = {};


start = 1; %used to set the start of data range for each epoch
finish = numPoints; %same as bove but for the end of the range
epochNumber = 1;
while(finish < size(data, 1))
   epochCol{epochNumber,1} = data(start:finish, colNum);
   start = finish;
   finish = finish + numPoints;
   epochNumber = epochNumber + 1;
end
end