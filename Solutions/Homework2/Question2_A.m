function Question2_A(h,evt)
% h and evt are unused but is written for matlab compilability
close;clear;

if isfile('data.mat')
    load('data.mat','img_name') % load image from data.mat
else
    img_name = 'cameraman.tif'; % default image is cameraman.tif
end

fig = figure('Name','HomeWork 2','Position',[400 100 600 500]);

% Create Button "back to main" using JButton from java
JButtonString = '<html>&#x21b6; Back To Main</html>';
jButton = javaObjectEDT('javax.swing.JButton',JButtonString);
matlabButton = javacomponent(jButton,[40,460,120,30],fig);
% make it back to main
set(matlabButton, 'ActionPerformedCallback', @Main);

%% Real Question Code

img = imread(img_name);

x = 2; % number of images on x axsis
y = 3; % number of images on y axsis

% filters
f(:,:,1) = fspecial('average',3); % first low filter
f(:,:,2) = 1/10*[1 1 1;1 2 1;1 1 1]; % second low filter
f(:,:,3) = 1/16*[2 1 2;1 4 1;2 1 2]; % third low filter

f(:,:,4) = 1/9*[-1 -1 -1;-1 8 -1; -1 -1 -1]; % first high filter
f(:,:,5) = 1/6*fspecial('laplacian',0); % second high filter
f(:,:,6) = 1/16*[-1 -2 -1;-2 12 -2;-1 -2 -1]; % third high filter

% plotting
for i=1:length(f(:,:,:))
    subplot(x,y,i);
    g = imfilter(img,f(:,:,i));
    imshow(g);
    title(i);
end

end