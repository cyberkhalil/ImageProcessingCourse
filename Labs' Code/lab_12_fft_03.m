
close all; clear all; clc;

f=[ones(256, 512);zeros(256, 512)];
figure;
subplot (1,3,1);
imshow(f, 'InitialMagnification', 'fit');
title('original');

h = fspecial('gaussian', 5, 10);

g = imfilter(f, h);
subplot (1,3,2);
imshow(g, 'InitialMagnification', 'fit');
title('filter spatial');
