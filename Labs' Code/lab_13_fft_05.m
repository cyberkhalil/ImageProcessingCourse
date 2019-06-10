close all;
clear all;
clc;

f=imread('cameraman.tif');
figure;
subplot (2,3,1);
imshow(f, 'InitialMagnification', 'fit');
title('original');

[f, revertclass] = tofloat(f) ;
F = fft2(f) ;
Fs = fftshift(log(1+abs(F)));
subplot (2,3,2);
imshow(Fs, [], 'InitialMagnification', 'fit');
title('Log shift DFT');

h = fspecial('sobel');
gs = imfilter(f, h);
subplot (2,3,3);
imshow(abs(gs), 'InitialMagnification', 'fit');
title('Sobel Spatial');

%filter size equal to padded image
PQ = paddedsize(size(f));
H = freqz2(h, PQ(1), PQ(2));
H = ifftshift(H);

subplot (2,3,4);
imshow(abs(fftshift(H)), [], 'InitialMagnification', 'fit');
title('Sobel');

gf = dftfilt(f, H);
subplot (2,3,5);
imshow(abs(gf), 'InitialMagnification', 'fit');
title('Sobel Frequency');

