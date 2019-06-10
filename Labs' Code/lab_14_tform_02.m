close all;
clear all;
clc;

WZ = pointgrid([0 0; 100 100]);

%tform = maketform( 'affine', T)
%example 1 rotation

theta = pi/4;
T = [cos(theta) sin(theta) 0; ...
    -1*sin(theta) cos(theta) 0; ...
    0 0 1];
tform1 = maketform( 'affine', T);
figure;
vistform(tform1, WZ);

%example 1 projective
WZ = pointgrid([0 0; 1 1]);
T = [-2.7390 0.2929 -0.6373; ...
    0.7426 -0.7500 0.8088; ...
    2.8750 0.7500 1.0000];

tform2 = maketform( 'projective', T);
figure;
vistform(tform2, WZ);
