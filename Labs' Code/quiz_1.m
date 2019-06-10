
close all;
clear all;
clc;

A=2;
t=-3*pi:0.1:3*pi;
phi=pi/4;
f=A*sin(t+phi);


f2=two_D_sine(A,pi/4,pi/4,512,512);

figure;
subplot(1,2,1);
plot(t,f);
subplot(1,2,2);
imshow(f2);

f2_int = im2uint8(f2);
imwrite(f2_int, 'sin_1_2_d.jpg');