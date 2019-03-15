%%simulation of histogram equalization
close all; clear all;

f = imread('cameraman.tif');

%sum to 1
h1 = fspecial('average',3);
h2 = fspecial('disk',1);
h3 = fspecial('gaussian',3,1);
h4 = fspecial('motion',10,-180);
h9 = fspecial('motion',10,180);

%sum to 0
h5 = fspecial('laplacian',0);
h6 = fspecial('log',3,0.5);
h7 = fspecial('prewitt');
h8 = fspecial('sobel');


figure('Name', 'fspecial filters');
subplot(3,3,1);
imshow(f);
title('original');

g1 = imfilter(f,h1);
subplot(3,3,2);
imshow(g1);
title('average');

g2 = imfilter(f,h2);
subplot(3,3,3);
imshow(g2);
title('disk');

g3 = imfilter(f,h3);
subplot(3,3,4);
imshow(g3);
title('gaussian');

g4 = imfilter(f,h4);
subplot(3,3,5);
imshow(g4);
title('motion');

% g9 = imfilter(g4,h9);
% subplot(3,3,6);
% imshow(g9);
% title('motion');

g5 = imfilter(f,h5);
subplot(3,3,6);
imshow(g5);
title('laplacian');

g6 = imfilter(f,h6);
subplot(3,3,7);
imshow(g6);
title('log');

g7 = imfilter(f,h7);
subplot(3,3,8);
imshow(g7);
title('prewitte');

g8 = imfilter(f,h8);
subplot(3,3,9);
imshow(g8);
title('sobel');


