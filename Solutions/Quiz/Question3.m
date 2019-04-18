function Question3(~,~)
close;clear;

% the next line is only the new line for homework 4
imfilter = @frequency_imfilter;

if isfile('data.mat')
    load('data.mat','img_name') % load image from data.mat
else
    img_name = 'cameraman.tif'; % default image is cameraman.tif
end

fig = figure('Name','HomeWork 2','Position',[400 100 800 500]);

% Create Button "back to main" using JButton from java
JButtonString = '<html>&#x21b6; Back To Main</html>';
jButton = javaObjectEDT('javax.swing.JButton',JButtonString);
matlabButton = javacomponent(jButton,[40,460,120,30],fig);
% make it back to main
set(matlabButton, 'ActionPerformedCallback', @Main);

%% Real Question Code

x = 2; % number of images on x axsis
y = 4; % number of images on y axsis

I = imread(img_name);

% Equations from question
GetG = @(Gx ,Gy) sqrt(power(Gx,2)+power(Gy,2));
GetGx = @(EDx,I) im2double(imfilter(I,EDx));
GetGy = @(EDy,I) im2double(imfilter(I,EDy));

%% Section a
EDx = -fspecial('prewitt')'; %[-1 0 1;-1 0 1;-1 0 1];
EDy = -fspecial('prewitt');  %[-1 -1 -1;0 0 0;1 1 1];
Gx = GetGx(EDx,I);
Gy = GetGy(EDy,I);
G = GetG(Gx,Gy);

subplot(x,y,1);
imshow(I);
title('origin');

subplot(x,y,2);
imshow(Gx);
title('EDx prewitt filter');

subplot(x,y,3);
imshow(Gy);
title('EDy prewitt filter');

subplot(x,y,4);
imshow(G);
title('G prewitt filter');

%% Section b
EDx = -fspecial('sobel')'; %[-1 0 1;-2 0 2;-1 0 1];
EDy = -fspecial('sobel');  %[-1 -2 -1;0 0 0;1 2 1];
Gx = GetGx(EDx,I);
Gy = GetGy(EDy,I);
G = GetG(Gx,Gy);

subplot(x,y,y+1);
imshow(I);
title('origin');

subplot(x,y,y+2);
imshow(Gx);
title('EDx sobel filter');

subplot(x,y,y+3);
imshow(Gy);
title('EDy sobel filter');

subplot(x,y,y+4);
imshow(G);
title('G sobel filter');

end