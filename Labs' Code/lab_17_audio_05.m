close all;
clear all;
clc;

load handel.mat

y_freq1 = fft(y, length(y));
% y_real = real(y_freq1);
% 
% [r,~] = find(y_real<2);
% y_freq1(r)=0;

subplot(3,1,1);
plot(y);

subplot(3,1,2);
plot(abs(y_freq1));

subplot(3,1,3);
plot(fftshift(abs(y_freq1)));
[b,a] = butter(6,[200 500]/Fs, 'bandpass');
%b = [2 -0.25 -0.25 0.5 -0.25 -0.25 -0.25];
%a = 1;
b_f1 = freqz(b, a, length(y));

y_filtered_freq = b_f1.*y_freq1;
y_filtered = ifft(y_filtered_freq, length(y),'symmetric');
soundsc(y_filtered);