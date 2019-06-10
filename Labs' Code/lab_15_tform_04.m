close all;
clear all;
clc;

%f=checkerboard(50);
f=imread('cameraman.tif');

figure;
subplot(2,3,2);
imshow(f, 'InitialMagnification', 'fit');
title 'original'


% theta = pi/3;
% T2 = [cos(theta) sin(theta) 0; ...
% -sin(theta) cos(theta) 0; ...
% 0 0 1 ];

sx = 1.3;
sy = 0.7;

T2 = [sx 0 0; ...
    0 sy 0; ...
    0 0 1];

tform2 = maketform('affine',T2);
g2 = imtransform(f,tform2, 'bilinear');

subplot(2,3,4);
imshow(g2, 'InitialMagnification', 'fit');
title 'rotation-bilinear'


g2 = imtransform(f,tform2, 'bicubic');

subplot(2,3,5);
imshow(g2, 'InitialMagnification', 'fit');
title 'rotation-bicubic'

g2 = imtransform(f,tform2, 'nearest');

subplot(2,3,6);
imshow(g2, 'InitialMagnification', 'fit');
title 'rotation-nearest'

