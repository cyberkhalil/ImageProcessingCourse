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
