close all; clear all; clc;

r = rand(512,512); % r = randi([0 255], 512,512);
g = rand(512,512);
b = rand(512,512);

% build an image
%1-
rgb1(:,:, 1) = r;
rgb1(:,:, 2) = g;
rgb1(:,:, 3) = b;
%2-
rgb2 = cat(3, r, g, b);

%split to get component
r1 = rgb1(:,:,1);
g1 = rgb1(:,:,2);
b1 = rgb1(:,:,3);

rgbcube;

% I = imread('images\mandril_color.tif');
% r_channel(:,:,3) = I(:,:,3);
% r_channel(:,:,1) = 0;
% r_channel(:,:,2) = 0;
% 
% imshow(r_channel);
