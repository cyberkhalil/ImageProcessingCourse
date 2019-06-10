close all;
clear all;
clc;

f=imread('cameraman.tif');
figure;
subplot (3,3,2);
imshow(f, 'InitialMagnification', 'fit');
title('original');

[f, revertclass] = tofloat(f);
PQ = paddedsize(size(f));
[U, V] = dftuv(PQ(1), PQ(2));
D = hypot(U, V);


%D0 = 50; %0.05*PQ(2);
%F = fft2(f, PQ(1), PQ(2)); 
%H = exp(-(D.^2)/(2*(D0^2)));
H = lpfilter('ideal', PQ(1), PQ(2), 50);
g = dftfilt(f, H);
subplot (3,3,4);
imshow(g, 'InitialMagnification', 'fit');
title('Ideal LP');

H = lpfilter('btw', PQ(1), PQ(2), 50, 1);
g = dftfilt(f, H);
subplot (3,3,5);
imshow(g, 'InitialMagnification', 'fit');
title('Butterworth LP');

H = lpfilter('gaussian', PQ(1), PQ(2), 50);
g = dftfilt(f, H);
subplot (3,3,6);
imshow(g, 'InitialMagnification', 'fit');
title('Gaussian LP');


H = 1-lpfilter('ideal', PQ(1), PQ(2), 50);
g = dftfilt(f, H);
subplot (3,3,7);
imshow(g, 'InitialMagnification', 'fit');
title('Ideal HP');

H = hpfilter('btw', PQ(1), PQ(2), 50, 1);
g = dftfilt(f, H);
subplot (3,3,8);
imshow(g, 'InitialMagnification', 'fit');
title('Butterworth HP');

H = hpfilter('gaussian', PQ(1), PQ(2), 50);
g = dftfilt(f, H);
subplot (3,3,9);
imshow(g, 'InitialMagnification', 'fit');
title('Gaussian HP');