close all; clear all; clc;

%read images

[f1, cmap1] = imread('images\mandril_color.tif');
[f2, cmap2] = imread('onion.png');



figure;
subplot(2,4,1);
imshow(f1);
subplot(2,4,5);
imshow(f2);

% create indexed image
[f1_ind, cmap1_ind] = rgb2ind(f1, 4);
subplot(2,4,2);
imshow(f1_ind, cmap1_ind);

%
[f2_ind, cmap2_ind] = rgb2ind(f2, 8);
f2_rgb = ind2rgb(f2_ind, cmap2_ind);
subplot(2,4,6);
imshow(f2_rgb);

f1_gray = rgb2gray(f1);
f2_gray = rgb2gray(f2);

subplot(2,4,3);
imshow(f1_gray);
subplot(2,4,7);
imshow(f2_gray);




