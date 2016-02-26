function [Fx,f] = fft_calc(x,fs)

N = numel(x);
f = 0:fs/N:fs/2 - fs/N;
temp = fft(x);
Fx = 20*log10(abs(temp(1:N/2)));