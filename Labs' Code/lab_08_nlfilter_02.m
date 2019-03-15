%%simulation of histogram equalization
close all; clear all;

f = imread('cameraman.tif');

%B = nlfilter(A,[m n],fun)
%B = colfilt(A,[m n],block_type,fun)

%1-define a function
fun = @(x) median(x(:));

%2- apply nlfilter
g1 = nlfilter(f,[3 3],fun);



figure('Name', 'fspecial filters');
subplot(1,2,1);
imshow(f);
title('original');

subplot(1,2,2);
imshow(g1);
title('nlfilter');
