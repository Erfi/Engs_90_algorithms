%Erfan Azad
%Date: 21 Feb 2016
%Description: Function for down sampling the data in the given matrix
%Saves the result in the given directory
%DownSamples the data of given matrix
%
%INPUT:
%rawMatrix: Matrix of data. Can be of different sizes.
%SR: saving sample rate
%saveDirectoryandName: directory to save the down sampled data and a name for
%saving in form of './data/myDownSampledData.mat'
function [ data ] = downSample( rawMatrix, SR, saveDirectoryandName)

numCols = size(rawMatrix,2);
sampleRate = SR;
savingName = saveDirectoryandName;

%down sample each column
for i = 1:numCols
   data_down{i} = decimate(rawMatrix(:,i), 10, 'fir');
end

%concatentate the downsampled columns together
data = data_down{1};
for j= 2:numCols
    data = horzcat(data,data_down{j});
end

%save the down sampled matrix
save(savingName, 'data', 'sampleRate');
end

