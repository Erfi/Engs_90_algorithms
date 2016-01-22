function [ avgPSD_array ] = average_PSD( epoch )
%This funciton takes in a Cell array of epoches for each sensor (2D array)
%and spits out a (2D array of (avgPSD4epochNumber,sensorNumber))
%NOTE: PSD --> Power-Spectrum-Density
% avgPSD_array = zeros(size(epoch,1), size(epoch,2));
for sensorNum = 1:size(epoch,2)
   for epochNum = 1:size(epoch,1)
      psd = dspdata.psd(abs(epoch{epochNum, sensorNum})); 
      avgPSD_array(epochNum,sensorNum) = avgpower(psd);
   end
end
end

