close all;
clear all;
clc;

load handel.mat

a1 = y(1400:2000);
a2 = y(2200:3000);

subplot(2,2,1);
plot(a1);
subplot(2,2,2);
plot(a2);

N1=length(a1);
N2=length(a2);
fft_a1=fft(a1);
fft_a1=abs(fft_a1(1:N1/2));
fft_a2=fft(a2);
fft_a2=abs(fft_a2(1:N2/2));

subplot(2,2,3);
plot(fft_a1);
subplot(2,2,4);
plot(fft_a2);


a1_lowf=sum(fft_a1(1:N1/4))/(N1/4);
a1_highf=sum(fft_a1(1+N1/4:N1/2))/(N1/4);
a2_lowf=sum(fft_a2(1:N2/4))/(N2/4);
a2_highf=sum(fft_a2(1+N2/4:N2/2))/(N2/4);

a1_ratio=a1_highf/a1_lowf;
a2_ratio=a2_highf/a2_lowf;

