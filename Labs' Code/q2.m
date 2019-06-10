close all; clear all;

I = imread('onion.png');

figure;
imshow(I);

figure;
[index, map] = rgb2ind(I, 6, 'dither');

colors = [0.5 0.5 0.5;
          1 1 1;
          1 0 0;
          0 1 0;
          0 0 1;
          0 0 0];
%rgb_c = ind2rgb(index, colors);
imshow(index, colors);