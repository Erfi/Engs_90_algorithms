function [ varargout ] = splitCols( dataMatrix )
    numCols = size(dataMatrix,2);
    for num = 1:numCols
       varargout{num} = dataMatrix(:,num); 
    end
end

