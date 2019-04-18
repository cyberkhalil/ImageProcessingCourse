function Question1(h,evt)
% h and evt are unused but is written for matlab compilability
close;clear;

if isfile('data.mat')
    load('data.mat','img_name') % load image from data.mat
else
    img_name = 'pout.tif'; % default image is pout.tif
end

fig = figure('Name','HomeWork 2','Position',[400 100 600 500]);

% Create Button "back to main" using JButton from java
JButtonString = '<html>&#x21b6; Back To Main</html>';
jButton = javaObjectEDT('javax.swing.JButton',JButtonString);
matlabButton = javacomponent(jButton,[40,460,120,30],fig);
% make it back to main
set(matlabButton, 'ActionPerformedCallback', @Main);

%% Real Question code

I = imread(img_name);
x = 2;
y = 4;

%% origin
subplot(x,y,1);
imshow(I);
title('origin');

subplot(x,y,1+y);
imhist(I);
title('origin histogram');



%% imadjust
subplot(x,y,2);
g = imadjust(I, [], [], 0.5); % imadjust : power nthroot
imshow(g);
title('imadjust');

subplot(x,y,2+y);
imhist(g);
title('imadjust histogram');



%% histeq
subplot(x,y,3);
% imadjust : power nthroot
g = histeq(I);
imshow(g);
title('histeq');

subplot(x,y,3+y);
imhist(g);
title('histeq histogram');


%% adapthisteq
subplot(x,y,4);
g = adapthisteq(I);
imshow(g);
title('adapthisteq');

subplot(x,y,4+y);
imhist(g);
title('adapthisteq histogram');

end