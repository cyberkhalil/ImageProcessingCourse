%% settings
close all;
clear;
clc;

%% load image
f = imread('pout.tif');
% f1 = imread('cameraman.tif');
% f2 = imread('jetplane.tif');
% f3 = imread('peppers_gray.tif');
% f4 = imread('livingroom.tif');
% f5 = imread('mandril_gray.tif');

figure;
subplot(1,5,1);
imshow(f, 'InitialMagnification', 'fit');
title('original image');

[h, l] = imhist(f, 64); % linspace(0, 255, 64);

% plot using imhist
subplot(1,5,2);
imhist(f, 64);
%axis('square'); %'square

%plot using plot
subplot(1,5,3);
plot(l, h);
axis('square');
axis([0 Inf 0 Inf]);

%plot using bar
subplot(1,5,4);
bar(h);
axis('square');
axis([0 Inf 0 Inf]);

%plot using stem
subplot(1,5,5);
stem(h);
axis('square');
axis([0 Inf 0 Inf]);

