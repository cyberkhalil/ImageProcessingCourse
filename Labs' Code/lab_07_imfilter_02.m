%%simulation of histogram equalization
close all; clear all;


%g = imfilter(f, w, filtering_mode, boundary_options, size_options)

f = imread('cameraman.tif');
w = [1 1 1; 
     1 -1 1; 
     1 1 1];
  
g1 = imfilter(f,w, 'corr', 'symmetric', 'same');
diff = double(f)-double(g1);
%diff_sum = sum(diff(:));

figure;
subplot(1,3,1);
imshow(f);
subplot(1,3,2);
imshow(g1);

subplot(1,3,3);
imshow(diff);
