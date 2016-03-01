%last modified: Feb 15 2016 by Erfan Azad
%========================================
function [ varargout ] = make_TimeSeries( SR, varargin )
    timeStep = 1/SR; 
    initialTime = 0;
    
    for i = 1:nargin-1
        endTime = (size(varargin{i},1)/SR)-timeStep;%-timeStep is for indexing correctly
        time = [0:timeStep:endTime]';
        varargout{i} = horzcat(time,varargin{i}); 
    end
end

