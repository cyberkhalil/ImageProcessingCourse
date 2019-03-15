%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

g2 = imadjust(f,[0.3 0.7],[],1);

%%%%%%
g3 = 1./(1+(128./double(f)).^4);
subplot(2,5,4);
imshow(g3, 'InitialMagnification', 'fit');
title('original image');

subplot(2,5,9);
imhist(g3);
axis([0 Inf 0 Inf]);

%%%%%%
g4 = 2*log(1+im2double(f));
subplot(2,5,5);
imshow(g4, 'InitialMagnification', 'fit');
title('original image');

subplot(2,5,10);
imhist(g4);
axis([0 Inf 0 Inf]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LAB 6 (lab_06_histeq_01.m)
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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (lab_06_histeq_01.m)
%%simulation of histogram equalization
close all; clear all;

%image size
r=512;
c=512;
rc = [r c];

%setting
p=8; % number of levels
imin=0; imax=2^p-1; % min and max values of the image [0 255]
d = makedist('Lognormal', 80, 4); % to generate a random number
dt = truncate(d,0,255); % to truncate values to 0 and 255
img=uint8(round(dt.random(512))); % the random number

%show the image and the histogram
figure;
subplot(2,2,1);
imshow(img);
title('original data');
subplot(2,2,2);
h = histogram(img(:),0:imax+1);
title('Hist of original data');

% count the histogram and the pro and the cdf
count = h.Values;
propability = count/numel(img);
cdf_k = cumsum(propability);
sk = round(imax.*cdf_k);

% map to the new values
img_eq=sk(img(:)+1);
img_eq=reshape(img_eq,rc);

%show the image after the histogram equalization and its histogram
subplot(2,2,3);
imshow(uint8(img_eq));
title('hist_eq data');
subplot(2,2,4);
h_eq = histogram(img_eq(:),0:imax+1);
title('Hist of hist_eq data');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% lab 06 histeq
close all; clear all;

%image size
r=512;
c=512;
rc = [r c];

%setting
p=8; % number of levels
imin=0; imax=2^p-1; % min and max values of the image [0 255]
d = makedist('Lognormal', 80, 4); % to generate a random number
dt = truncate(d,0,255); % to truncate values to 0 and 255
img=uint8(round(dt.random(512))); % the random number

%show the image and the histogram
figure;
subplot(2,2,1);
imshow(img);
title('original data');
subplot(2,2,2);
h = histogram(img(:),0:imax+1);
title('Hist of original data');

% count the histogram and the pro and the cdf
count = h.Values;
propability = count/numel(img);
cdf_k = cumsum(propability);
sk = round(imax.*cdf_k);

% map to the new values
img_eq=sk(img(:)+1);
img_eq=reshape(img_eq,rc);

%show the image after the histogram equalization and its histogram
subplot(2,2,3);
imshow(uint8(img_eq));
title('hist_eq data');
subplot(2,2,4);
h_eq = histogram(img_eq(:),0:imax+1);
title('Hist of hist_eq data');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% lab 7 (1)
%%simulation of histogram equalization
close all; clear all;

I = imread('cameraman.tif');

I_number = padarray(I, [3 3], 0);
I_rep = padarray(I, [3 3], 'replicate');
I_sym = padarray(I, [3 3], 'symmetric');
I_circ = padarray(I, [3 3], 'circular');

figure;
subplot(1,5,1);
imshow(I);

subplot(1,5,2);
imshow(I_number);

subplot(1,5,3);
imshow(I_rep);

subplot(1,5,4);
imshow(I_sym);

subplot(1,5,5);
imshow(I_circ);

%imtool(I_sym)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% lab 7 (2)
%%simulation of histogram equalization
close all; clear all;


%g = imfilter(f, w, filtering_mode, boundary_options, size_options)

f = imread('cameraman.tif');
w = [1 1 1; 
     1 -1 1; 
     1 1 1];
  
g1 = imfilter(f,w, 'corr', 'symmetric', 'same');
diff = double(f)-double(g1);
%diff_sum = sum(diff(:));

figure;
subplot(1,3,1);
imshow(f);
subplot(1,3,2);
imshow(g1);

subplot(1,3,3);
imshow(diff);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% lab 8 (1)
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% lab 8 (2)
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% lab 9 (1)
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% lab 9 (2)

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
