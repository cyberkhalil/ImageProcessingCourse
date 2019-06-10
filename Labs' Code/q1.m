
close all; clear all;

I = imread('pout.tif');

figure;
subplot(2,2,1);
imshow(I);
title('Original');

subplot(2,2,2);
imhist(I);
title('Original Hist');

g=histeq(I);
subplot(2,2,3);
imshow(g);
title('Original Hist Eq');

subplot(2,2,4);
imhist(g);
title('Hist Eq. Image');

l1=lowpass_filter(1);
l2=lowpass_filter(2);
gl1=imfilter(I,l1);
gl2=imfilter(I,l2);
ghl1=imfilter(g,l1);
ghl2=imfilter(g,l2);

figure;
subplot(2,4,1);
imshow(gl1);
subplot(2,4,2);
imhist(gl1);
subplot(2,4,3);
imshow(gl2);
subplot(2,4,4);
imhist(gl2);

subplot(2,4,5);
imshow(ghl1);
subplot(2,4,6);
imhist(ghl1);
subplot(2,4,7);
imshow(ghl2);
subplot(2,4,8);
imhist(ghl2);

l1=highpass_filter(1);
l2=highpass_filter(2);
gl1=imfilter(I,l1);
gl2=imfilter(I,l2);
ghl1=imfilter(g,l1);
ghl2=imfilter(g,l2);

figure;
subplot(2,4,1);
imshow(gl1);
subplot(2,4,2);
imhist(gl1);
subplot(2,4,3);
imshow(gl2);
subplot(2,4,4);
imhist(gl2);

subplot(2,4,5);
imshow(ghl1);
subplot(2,4,6);
imhist(ghl1);
subplot(2,4,7);
imshow(ghl2);
subplot(2,4,8);
imhist(ghl2);
