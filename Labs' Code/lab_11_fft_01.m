
close all; clear all; clc;

%f=zeros(512, 512);
%f(210:282, 246:265) = 1;

%f=two_D_sine(2,pi/2,pi/2,512,512);

f=imread('cameraman.tif');

figure;
subplot (2,3,1);
imshow(f, 'InitialMagnification', 'fit');
title('original');

%DFT
F = fft2(f);
R = real(F);
I = imag(F);
S = abs(F);
Sp = S.^2;

%visualize fft
subplot (2,3,2);
imshow(S, [], 'InitialMagnification', 'fit');
title('FFT');

F_shift = fftshift(F);
S_shift = abs(F_shift);
subplot (2,3,3);
imshow(S_shift, [], 'InitialMagnification', 'fit');
title('FFT shift');

S_shift_log = log(1 + S_shift);
subplot (2,3,4);
imshow(S_shift_log, [], 'InitialMagnification', 'fit');
title('FFT log-shift');

phase1 = atan2(I, R);
phase2 = angle(F);
subplot (2,3,5);
imshow(phase2, [], 'InitialMagnification', 'fit');
title('FFT phase');

f_i = ifft2(F);
subplot (2,3,6);
imshow(f_i, [], 'InitialMagnification', 'fit');
title('inverse FFT');
