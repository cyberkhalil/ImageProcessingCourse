%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

g2 = imadjust(f,[0.3 0.7],[],1);

%%%%%%
g3 = 1./(1+(128./double(f)).^4);
subplot(2,5,4);
imshow(g3, 'InitialMagnification', 'fit');
title('original image');

subplot(2,5,9);
imhist(g3);
axis([0 Inf 0 Inf]);

%%%%%%
g4 = 2*log(1+im2double(f));
subplot(2,5,5);
imshow(g4, 'InitialMagnification', 'fit');
title('original image');

subplot(2,5,10);
imhist(g4);
axis([0 Inf 0 Inf]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LAB 6 (lab_06_histeq_01.m)
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
f5 = imread('mandril_gray.tif');

figure;
subplot(2,6,1);
imshow(f, 'InitialMagnification', 'fit');
title('original image pout');
subplot(2,6,2);
imhist(f);
title('histogram pout');

g=histeq(f);
subplot(2,6,3);
imshow(g, 'InitialMagnification', 'fit');
title('histogram eq pout');
subplot(2,6,4);
imhist(g);
title('histogram eq pout');

g2=imhistmatch(f,f5);
subplot(2,6,5);
%imhist(g2);
imshow(g2, 'InitialMagnification', 'fit');
title('histogram match pout');

g3=adapthisteq(f, 'NumTiles', [2 2], 'NBins', 256, 'Range', 'full');
subplot(2,6,6);
imshow(g3, 'InitialMagnification', 'fit');
title('histogram adaptive pout');

subplot(2,6,7);
imshow(f5, 'InitialMagnification', 'fit');
title('original image mandril');
subplot(2,6,8);
imhist(f5);
title('histogram mandril');

g5=histeq(f5);
subplot(2,6,9);
imshow(g5, 'InitialMagnification', 'fit');
title('histogram eq mandril');
subplot(2,6,10);
imhist(g5);
title('histogram eq mandril');

g6=imhistmatch(f5,f);
subplot(2,6,11);
imshow(g6, 'InitialMagnification', 'fit');
%imhist(g6);
title('histogram match mandril');

g7=adapthisteq(f5);
subplot(2,6,12);
imshow(g7, 'InitialMagnification', 'fit');
title('histogram adaptive mandril');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (lab_06_histeq_01.m)
%%simulation of histogram equalization
close all; clear all;

%image size
r=512;
c=512;
rc = [r c];

%setting
p=8; % number of levels
imin=0; imax=2^p-1; % min and max values of the image [0 255]
d = makedist('Lognormal', 80, 4); % to generate a random number
dt = truncate(d,0,255); % to truncate values to 0 and 255
img=uint8(round(dt.random(512))); % the random number

%show the image and the histogram
figure;
subplot(2,2,1);
imshow(img);
title('original data');
subplot(2,2,2);
h = histogram(img(:),0:imax+1);
title('Hist of original data');

% count the histogram and the pro and the cdf
count = h.Values;
propability = count/numel(img);
cdf_k = cumsum(propability);
sk = round(imax.*cdf_k);

% map to the new values
img_eq=sk(img(:)+1);
img_eq=reshape(img_eq,rc);

%show the image after the histogram equalization and its histogram
subplot(2,2,3);
imshow(uint8(img_eq));
title('hist_eq data');
subplot(2,2,4);
h_eq = histogram(img_eq(:),0:imax+1);
title('Hist of hist_eq data');
