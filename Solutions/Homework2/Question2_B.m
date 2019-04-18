function Question2_B(h,evt)
% h and evt are unused but is written for matlab compilability
close;clear;
%TODO: make img's shown after clicking on the button
if isfile('data.mat')
    load('data.mat','img_name') % load image from data.mat
else
    img_name = 'cameraman.tif'; % default image is cameraman.tif
end

fig = figure('Name','HomeWork 2','Position',[400 100 600 500]);

% Create Button "back to main" using JButton from java
JButtonString = '<html>&#x21b6; Back To Main</html>';
jButton = javaObjectEDT('javax.swing.JButton',JButtonString);
matlabButton = javacomponent(jButton,[40,470,120,30],fig);
% make it back to main
set(matlabButton, 'ActionPerformedCallback', @Main);

%% Real Question Code
x = 3;
y = 3;

%% section 1
subplot(x,y,1)
title('original');
img = imread(img_name);
imshow(img);


uicontrol("String","-","Position",[210,385,35,35]);


subplot(x,y,2)
title('low_pass_filter');
low_pass_filter = [1 1 1;1 -7 1;1 1 1];
g1 = imfilter(img,low_pass_filter);
imshow(g1);

uicontrol("String","=","Position",[380,385,35,35]);

% will be high_pass_filter
subplot(x,y,3)
title('result');
imshow(img-g1);

%% section 2

subplot(x,y,y+1)
title('original');
img = imread(img_name);
imshow(img);


uicontrol("String","-","Position",[210,240,35,35]);


subplot(x,y,y+2)
title('high_pass_filter');
high_pass_filter = 1/2*[-1 -1 -1;-1 8 -1;-1 -1 -1];
g2 = imfilter(img,high_pass_filter);
imshow(g2);

uicontrol("String","=","Position",[380,240,35,35]);

% will be low_pass_filter
subplot(x,y,y+3)
title('result');
imshow(img-g2);

%% section 3
subplot(x,y,y+y+1)
title('low_pass_filter');
imshow(g1);


uicontrol("String","+","Position",[210,100,35,35]);


subplot(x,y,y+y+2)
title('high_pass_filter');
imshow(img-g1);

uicontrol("String","=","Position",[380,100,35,35]);

% will be original
subplot(x,y,y+y+3)
title('result');
imshow(img);

end