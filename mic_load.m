clear; clc; clf;

load('output.mat')
N = numel(mic_notch);

t = (0:N-1)/fs;

plot(mic_notch)