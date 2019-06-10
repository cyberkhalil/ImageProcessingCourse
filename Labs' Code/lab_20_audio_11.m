close all;
clear all;
clc;

load handel.mat

subplot(2,1,1);
plot(y);

w=240;
n=floor(length(y)/w);
fpow_all = zeros(1,n);
amd_all = zeros(1,n);
for k=1:n
    seg=y(1+(k-1)*w:k*w);
    fpow_all(k) = fpow(seg);
    amd_all(k) = amdf(seg);
end

subplot(2,1,2);
plot(1:n, fpow_all, 'r');
hold on;
plot(1:n, amd_all, 'b');

% figure();
% plot(y(1:240));