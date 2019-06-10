close all; clear all; clc;

I = imread('peppers.png');

figure;
R=cat(3, 1*I(:,:,1),0*I(:,:,2), 0*I(:,:,3)); %I(:,:,1);
G=cat(3, 0*I(:,:,1),1*I(:,:,2), 0*I(:,:,3));
B=cat(3, 0*I(:,:,1),0*I(:,:,2), 1*I(:,:,3));
subplot(2,2,1);
imshow(I);
subplot(2,2,2);
imshow(R)
subplot(2,2,3);
imshow(G)
subplot(2,2,4);
imshow(B)

figure;
I_c = imcomplement(I);
C=cat(3, 0*I_c(:,:,1),1*I_c(:,:,2), 1*I_c(:,:,3)); %I(:,:,1);
M=cat(3, 1*I_c(:,:,1),0*I_c(:,:,2), 1*I_c(:,:,3));
Y=cat(3, 1*I_c(:,:,1),1*I_c(:,:,2), 0*I_c(:,:,3));
subplot(2,2,1);
imshow(I_c);
subplot(2,2,2);
imshow(C)
subplot(2,2,3);
imshow(M)
subplot(2,2,4);
imshow(Y)

figure;
[i_ntsc] = rgb2ntsc(I);
subplot(2,2,1);
imshow(I);
subplot(2,2,2);
imshow(i_ntsc(:,:,1))
subplot(2,2,3);
imshow(i_ntsc(:,:,2))
subplot(2,2,4);
imshow(i_ntsc(:,:,3))
%
figure;
i_ntsc(:,:,2) = 0;
rgb_ntsc = ntsc2rgb(i_ntsc);
subplot(1,2,1);
imshow(I);
subplot(1,2,2);
imshow(rgb_ntsc)

figure;
[i_ycbcr] = rgb2ycbcr(I);
subplot(2,2,1);
imshow(I);
subplot(2,2,2);
imshow(i_ycbcr(:,:,1));
subplot(2,2,3);
imshow(cat(3,0*i_ycbcr(:,:,2),0*i_ycbcr(:,:,2),i_ycbcr(:,:,2)))
subplot(2,2,4);
imshow(cat(3,i_ycbcr(:,:,3),0*i_ycbcr(:,:,3),0*i_ycbcr(:,:,3)))

% to generate colors
c = hsv(10);
