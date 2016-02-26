function [ sec ] = clkTime2bioTime( start_clkH, start_clkM, start_clkS, h,m,s)
% first three parameters are when the biopach started recording (digital clock)
% the second three parameters are when the event has happened (digital clock)
% returns number of seconds after the start of the clock to the event

sec = (h - start_clkH)*3600 + (m - start_clkM)*60 + (s - start_clkS);


end

