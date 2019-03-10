%%simulation of histogram equalization
close all; clear all;

%image size
r=512;
c=512;
rc = [r c];

%setting
p=8; % number of levels
imin=0; imax=2^p-1; % min and max values of the image [0 255]
d = makedist('Lognormal', 80, 4); % to generate a random number
dt = truncate(d,0,255); % to truncate values to 0 and 255
img=uint8(round(dt.random(512))); % the random number

%show the image and the histogram
figure;
subplot(2,2,1);
imshow(img);
title('original data');
subplot(2,2,2);
h = histogram(img(:),0:imax+1);
title('Hist of original data');

% count the histogram and the pro and the cdf
count = h.Values;
propability = count/numel(img);
cdf_k = cumsum(propability);
sk = round(imax.*cdf_k);

% map to the new values
img_eq=sk(img(:)+1);
img_eq=reshape(img_eq,rc);

%show the image after the histogram equalization and its histogram
subplot(2,2,3);
imshow(uint8(img_eq));
title('hist_eq data');
subplot(2,2,4);
h_eq = histogram(img_eq(:),0:imax+1);
title('Hist of hist_eq data');
