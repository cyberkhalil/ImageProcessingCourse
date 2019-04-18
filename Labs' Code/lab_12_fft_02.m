
close all; clear all; clc;

f=[ones(256, 512);zeros(256, 512)];
figure;
subplot (1,3,1);
imshow(f, 'InitialMagnification', 'fit');
title('original');


[M, N] = size(f);
[f, revertclass] = tofloat(f);
F = fft2(f);
sig = 10;
H=lpfilter('gaussian' , M, N, sig);
G = H.*F;
g = ifft2(G);
g = revertclass(g);

subplot (1,3,2);
imshow(g, 'InitialMagnification', 'fit');
title('filtered without padding');

PQ = paddedsize(size(f)); % f is floating point.
Fp = fft2(f, PQ(1), PQ(2)); % Compute the FFT with padding.
Hp = lpfilter('gaussian', PQ(1), PQ(2), 2*sig);
Gp = Hp.*Fp;
gp = ifft2(Gp);
gpc = gp(1:size(f,1), 1:size(f,2));
gpc = revertclass(gpc);

subplot (1,3,3);
imshow(gpc, 'InitialMagnification', 'fit');
title('FFT with padding');

