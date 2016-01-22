function [ peak2peak_array ] = peak2peak( epoch )
%This function takes a 2d cell array of epoches and 
%returns an arrays of corresponding peak2peak vals for each epoch

for sensorNum = 1:size(epoch,2)
   for epochNum = 1:size(epoch,1)
       minVal = min(epoch{epochNum, sensorNum});
       maxVal = max(epoch{epochNum, sensorNum});
       peak2peak_array(epochNum, sensorNum) = abs(maxVal - minVal);
   end
end

end

