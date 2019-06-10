close all;
clear all;
clc;

load handel.mat

subplot(2,1,1);
plot(y);

w=240;
n=floor(length(y)/w);
zcr_all = zeros(1,n);
for k=1:n
    seg=y(1+(k-1)*w:k*w);
    zcr_all(k) = zcr(seg);
end

subplot(2,1,2);
plot(1:n, zcr_all);

% figure();
% plot(y(1:240));