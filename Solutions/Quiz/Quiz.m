close all;clear all;clc;

imfilter = @frequency_imfilter;

img = imread('old_man.PNG');

f3 = fspecial('gaussian',10,3);

subplot(1,2,1);
imshow(img);
subplot(1,2,2);
imshow(imfilter(img,f3));

figure;
img = imread('broken_text.PNG');

f3 = fspecial('disk',1);

subplot(1,2,1);
imshow(img);
subplot(1,2,2);
imshow(imfilter(img,f3));
