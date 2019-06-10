close all; clear all; clc;

figure;
x=0:0.1:1;
r=zeros(256,256);
g=zeros(256,256);
b=zeros(256,256);
count = 1;

for i=x
    r(:,:)=i;
    g(:,:)=i;
    b(:,:)=i;
    rgb = cat(3,r,g,b);
    subplot(3,4, count);
    count = count  +1;
    imshow(rgb);
end