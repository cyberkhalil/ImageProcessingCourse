close all;
clear all;
clc;

load handel.mat %counting.mat %handel.mat

%spectrogram
spectrogram(y, 'yaxis');

%semilogy / semilogx
N = length(y);
mag = abs(fft(y));
semilogx(1:N, 20*log10(mag)*Fs/N);

%xcorr
[r, lags] = xcorr(y);
subplot(2,1,1)
plot(y);
subplot(2,1,2)
plot(r);

%Cpestrum
yfft = fft(y);
ps = abs(yfft);
pslog = log(ps);
y_ifft = ifft(pslog); %abs(ifft(pslog));
plot(y_ifft);