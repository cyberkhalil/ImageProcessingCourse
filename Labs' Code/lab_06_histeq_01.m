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