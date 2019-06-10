close all;
clear all;
clc;

%f=checkerboard(50);
f=imread('cameraman.tif');
figure;
subplot(2,2,1);
imshow(f, 'InitialMagnification', 'fit');
title 'original'


sx = 2;
sy = 0.5;

T = [sx 0 0; ...
    0 sy 0; ...
    0 0 1];

tform1 = maketform('affine',T); affine2d
g1 = imtransform(f,tform1);

subplot(2,2,2);
imshow(g1, 'InitialMagnification', 'fit');
title 'scale'


theta = pi/3;
T2 = [cos(theta) sin(theta) 0; ...
-sin(theta) cos(theta) 0; ...
0 0 1 ];

tform2 = maketform('affine',T2);
g2 = imtransform(f,tform2, 'FillValues', 0.5);

subplot(2,2,3);
imshow(g2, 'InitialMagnification', 'fit');
title 'rotation'

T3 = [0.4788 0.0135 -0.0009;...
0.0135 0.4788 -0.0009;...
0.5059 0.5059 1.0000];
tform3 = maketform('projective', T3);
g3 = imtransform(f, tform3, 'FillValue', 128);

subplot(2,2,4);
imshow(g3, 'InitialMagnification', 'fit');
title 'projective'
