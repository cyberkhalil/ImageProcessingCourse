%% settings
close all;
clear;
clc;

%% load image
f = imread('cameraman.tif');

figure;
subplot(2,5,1);
imshow(f, 'InitialMagnification', 'fit');
title('original image');

% imcomplement
g1 = 255-f;
subplot(2,5,2);
imshow(g1, 'InitialMagnification', 'fit');
title('Inverse');

% log g=c*log(f+eps) to avoid log(0)
g2 = 2*log(im2double(f)+1);
g3 = 2*log(double(f)+1);
subplot(2,5,3);
imshow(g2, [],'InitialMagnification', 'fit');
title('Log');
subplot(2,5,4);
imshow(g3, [],'InitialMagnification', 'fit');
title('Log');

% power nthroot
g4 = imadjust(f, [], [], 0.5);
subplot(2,5,5);
imshow(g4, [],'InitialMagnification', 'fit');
title('power#1');

lim = stretchlim(f);
% power nthroot % imadjust
g5 = imadjust(f, lim, [], 1);
subplot(2,5,6);
imshow(g5, [],'InitialMagnification', 'fit');
title('power#2');

% contrast stretch g = 1./(1+(m./f).^E) //double(f)) uint8(f)-binary image
g6 = 1./(1+(200./double(f)).^0.5);
subplot(2,5,7);
imshow(g6, [],'InitialMagnification', 'fit');
title('contrast stretch#1');
