%% settings
close all; clear all; clc;

% filters
average = fspecial('average',3);
disk = fspecial('disk',3);
log = fspecial('log',3); %laplacian

I = imread('images/cameraman.jpg');
x_size = 2;
y_size = 2;

subplot(x_size,y_size,1);
imshow(I);


subplot(x_size,y_size,2);
imhist(I);


subplot(x_size,y_size,3);
f = log;
m = imfilter(I,f);
imshow(m);


subplot(x_size,y_size,4);
imhist(m);




%
%%% code start here %%
%disp(' Loop based code')
%tic
%i = 0;
%for t = 0:.01:10^4
%    i = i + 1;
%    y2(i) = sin(t);
%end
%toc
% 
%disp(' Vectorized code')
%tic
%t = 0:.01:10^4;
%y1 = sin(t);
%toc
%isequal(y1,y2)
%%
%%%% Histogram
%%
%%
%%figure;
%%subplot(1,5,1);
%%imshow(f,'InitialMagnification','fix');
%%
%%title('original');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%% load image
%%f = imread('cameraman.tif');
%%
%%figure;
%%subplot(2,5,1);
%%imshow(f, 'InitialMagnification', 'fit');
%%title('original image');
%%
%%% imcomplement
%%g1 = 255-f;
%%subplot(2,5,2);
%%imshow(g1, 'InitialMagnification', 'fit');
%%title('Inverse');
%%
%%% log g=c*log(f+eps) to avoid log(0)
%%g2 = 2*log(im2double(f)+1);
%%g3 = 2*log(double(f)+1);
%%subplot(2,5,3);
%%imshow(g2, [],'InitialMagnification', 'fit');
%%title('Log');
%%subplot(2,5,4);
%%imshow(g3, [],'InitialMagnification', 'fit');
%%title('Log');
%%
%%% power nthroot
%%g4 = imadjust(f, [], [], 0.5);
%%subplot(2,5,5);
%%imshow(g4, [],'InitialMagnification', 'fit');
%%title('power%1');
%%
%%lim = stretchlim(f);
%%% power nthroot % imadjust
%%g5 = imadjust(f, lim, [], 1);
%%subplot(2,5,6);
%%imshow(g5, [],'InitialMagnification', 'fit');
%%title('power%2');
%%
%%% contrast stretch g = 1./(1+(m./f).^E) //double(f)) uint8(f)-binary image
%%g6 = 1./(1+(200./double(f)).^0.5);
%%subplot(2,5,7);
%%imshow(g6, [],'InitialMagnification', 'fit');
%%title('contrast stretch%1');
%%
%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%
%%%% load image
%%f = imread('pout.tif');
%%% f1 = imread('cameraman.tif');
%%% f2 = imread('jetplane.tif');
%%% f3 = imread('peppers_gray.tif');
%%% f4 = imread('livingroom.tif');
%%% f5 = imread('mandril_gray.tif');
%%
%%figure;
%%subplot(1,5,1);
%%imshow(f, 'InitialMagnification', 'fit');
%%title('original image');
%%
%%[h, l] = imhist(f, 64); % linspace(0, 255, 64);
%%
%%% plot using imhist
%%subplot(1,5,2);
%%imhist(f, 64);
%%%axis('square'); %'square
%%
%%%plot using plot
%%subplot(1,5,3);
%%plot(l, h);
%%axis('square');
%%axis([0 Inf 0 Inf]);
%%
%%%plot using bar
%%subplot(1,5,4);
%%bar(h);
%%axis('square');
%%axis([0 Inf 0 Inf]);
%%
%%%plot using stem
%%subplot(1,5,5);
%%stem(h);
%%axis('square');
%%axis([0 Inf 0 Inf]);
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%% load image
%%f = imread('pout.tif');
%%% f1 = imread('cameraman.tif');
%%% f2 = imread('jetplane.tif');
%%% f3 = imread('peppers_gray.tif');
%%% f4 = imread('livingroom.tif');
%%% f5 = imread('mandril_gray.tif');
%%
%%figure;
%%subplot(2,5,1);
%%imshow(f, 'InitialMagnification', 'fit');
%%title('original image');
%%
%%subplot(2,5,6);
%%imhist(f);
%%axis([0 Inf 0 Inf]);
%%%%%%%%
%%g1 = imcomplement(f);
%%subplot(2,5,2);
%%imshow(g1, 'InitialMagnification', 'fit');
%%title('original image');
%%
%%subplot(2,5,7);
%%imhist(g1);
%%axis([0 Inf 0 Inf]);
%%
%%%%%%%%
%%g2 = imadjust(f,[0.3 0.7],[],1);
%%subplot(2,5,3);
%%imshow(g2, 'InitialMagnification', 'fit');
%%title('original image');
%%
%%subplot(2,5,8);
%%imhist(g2);
%%axis([0 Inf 0 Inf]);
%%
%%%%%%%%
%%g3 = 1./(1+(128./double(f)).^4);
%%subplot(2,5,4);
%%imshow(g3, 'InitialMagnification', 'fit');
%%title('original image');
%%
%%subplot(2,5,9);
%%imhist(g3);
%%axis([0 Inf 0 Inf]);
%%
%%%%%%%%
%%g4 = 2*log(1+im2double(f));
%%subplot(2,5,5);
%%imshow(g4, 'InitialMagnification', 'fit');
%%title('original image');
%%
%%subplot(2,5,10);
%%imhist(g4);
%%axis([0 Inf 0 Inf]);