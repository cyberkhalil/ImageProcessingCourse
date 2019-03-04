%% settings
close all;
clear;
clc;

# octave command
pkg load image
x = 2;
y = 2;

f = imread('/home/khalil2535/Octave/lab_session/images/cameraman.jpg');

subplot(x,y,1);
imshow(f);

subplot(x,y,2);
imhist(f);

f_histeq = histeq(f);

subplot(x,y,3);
imshow(f_histeq);

subplot(x,y,4);
imhist(f_histeq);




##
#### Histogram
##
##img = imread('/home/khalil2535/Shared/Windows10/MatlabFiles/help/physmod/sm/ug/_anmtd_bevel_gear_anim.gif');
##
##figure;
##subplot(1,5,1);
##imshow(f,'InitialMagnification','fix');
##
##title('original');
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
###%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
##
##%% load image
##f = imread('cameraman.tif');
##
##figure;
##subplot(2,5,1);
##imshow(f, 'InitialMagnification', 'fit');
##title('original image');
##
##% imcomplement
##g1 = 255-f;
##subplot(2,5,2);
##imshow(g1, 'InitialMagnification', 'fit');
##title('Inverse');
##
##% log g=c*log(f+eps) to avoid log(0)
##g2 = 2*log(im2double(f)+1);
##g3 = 2*log(double(f)+1);
##subplot(2,5,3);
##imshow(g2, [],'InitialMagnification', 'fit');
##title('Log');
##subplot(2,5,4);
##imshow(g3, [],'InitialMagnification', 'fit');
##title('Log');
##
##% power nthroot
##g4 = imadjust(f, [], [], 0.5);
##subplot(2,5,5);
##imshow(g4, [],'InitialMagnification', 'fit');
##title('power#1');
##
##lim = stretchlim(f);
##% power nthroot % imadjust
##g5 = imadjust(f, lim, [], 1);
##subplot(2,5,6);
##imshow(g5, [],'InitialMagnification', 'fit');
##title('power#2');
##
##% contrast stretch g = 1./(1+(m./f).^E) //double(f)) uint8(f)-binary image
##g6 = 1./(1+(200./double(f)).^0.5);
##subplot(2,5,7);
##imshow(g6, [],'InitialMagnification', 'fit');
##title('contrast stretch#1');
##
##
##
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
###%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
##
##
##%% load image
##f = imread('pout.tif');
##% f1 = imread('cameraman.tif');
##% f2 = imread('jetplane.tif');
##% f3 = imread('peppers_gray.tif');
##% f4 = imread('livingroom.tif');
##% f5 = imread('mandril_gray.tif');
##
##figure;
##subplot(1,5,1);
##imshow(f, 'InitialMagnification', 'fit');
##title('original image');
##
##[h, l] = imhist(f, 64); % linspace(0, 255, 64);
##
##% plot using imhist
##subplot(1,5,2);
##imhist(f, 64);
##%axis('square'); %'square
##
##%plot using plot
##subplot(1,5,3);
##plot(l, h);
##axis('square');
##axis([0 Inf 0 Inf]);
##
##%plot using bar
##subplot(1,5,4);
##bar(h);
##axis('square');
##axis([0 Inf 0 Inf]);
##
##%plot using stem
##subplot(1,5,5);
##stem(h);
##axis('square');
##axis([0 Inf 0 Inf]);
##
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
###%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
##
##%% load image
##f = imread('pout.tif');
##% f1 = imread('cameraman.tif');
##% f2 = imread('jetplane.tif');
##% f3 = imread('peppers_gray.tif');
##% f4 = imread('livingroom.tif');
##% f5 = imread('mandril_gray.tif');
##
##figure;
##subplot(2,5,1);
##imshow(f, 'InitialMagnification', 'fit');
##title('original image');
##
##subplot(2,5,6);
##imhist(f);
##axis([0 Inf 0 Inf]);
##%%%%%%
##g1 = imcomplement(f);
##subplot(2,5,2);
##imshow(g1, 'InitialMagnification', 'fit');
##title('original image');
##
##subplot(2,5,7);
##imhist(g1);
##axis([0 Inf 0 Inf]);
##
##%%%%%%
##g2 = imadjust(f,[0.3 0.7],[],1);
##subplot(2,5,3);
##imshow(g2, 'InitialMagnification', 'fit');
##title('original image');
##
##subplot(2,5,8);
##imhist(g2);
##axis([0 Inf 0 Inf]);
##
##%%%%%%
##g3 = 1./(1+(128./double(f)).^4);
##subplot(2,5,4);
##imshow(g3, 'InitialMagnification', 'fit');
##title('original image');
##
##subplot(2,5,9);
##imhist(g3);
##axis([0 Inf 0 Inf]);
##
##%%%%%%
##g4 = 2*log(1+im2double(f));
##subplot(2,5,5);
##imshow(g4, 'InitialMagnification', 'fit');
##title('original image');
##
##subplot(2,5,10);
##imhist(g4);
##axis([0 Inf 0 Inf]);
##