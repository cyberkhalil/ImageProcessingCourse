close all;
clear all;
clc;

load handel.mat

y_freq1 = fft(y, length(y));
%soundsc(y,Fs);

b=[1, -0.9375];
yf=filter(b, 1, y);
%soundsc(yf);

w=256;
n=floor(length(y)/w);
for k=1:n
    seg=y(1+(k-1)*w:k*w);
    segf=filter(b, 1, seg);
    outsp(1+(k-1)*w:k*w)=segf;
end
%soundsc(outsp);

%update
w=256;
hst=[];
n=floor(length(y)/w);
for k=1:n
    seg=y(1+(k-1)*w:k*w);
    [segf, hst]=filter(b, 1, seg, hst);
    outsp2(1+(k-1)*w:k*w)=segf;
end
soundsc(outsp2);
