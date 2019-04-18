%% settings
close all;
clear;
clc;

%% to get an image
try
    f = imread('cameraman.tif');
catch e
    [filename, folder] = uigetfile('*','Select an Image (camera man is recommended)');
    f = imread([folder filename]);
end
%

%% gui code
main_fig = figure('Name','HomeWork 1','Position',[400 100 600 500]);
subplot(1,1,1);
imshow(f,'InitialMagnification','fit');

if exist('OCTAVE_VERSION', 'builtin') % if is octave use methods this way
c1 = uicontrol('Position',[60 5 120 40],"String","Question 1","CallBack","@Question1(0,0,f)");
c2 = uicontrol('Position',[240 5 120 40],"String","Question 2","CallBack","@Question2(0,0,f)");
c3 = uicontrol('Position',[420 5 120 40],"String","Question 3","CallBack","@Question3(0,0,f)");
else  % matlab methods
c1 = uicontrol('Position',[60 5 120 40],"String","Question 1","CallBack",{@Question1,f});
c2 = uicontrol('Position',[240 5 120 40],"String","Question 2","CallBack",{@Question2,f});
c3 = uicontrol('Position',[420 5 120 40],"String","Question 3","CallBack",{@Question3,f});
end