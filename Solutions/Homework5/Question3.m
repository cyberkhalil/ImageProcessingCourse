function Question3(~,~,new_figure)
%% question settings
if nargin==3 % nargin is the number of arraguments
    if new_figure==1
        figure;
    else
        new_figure=0;
    end
end

% load img
if isfile('data.mat')
    load('data.mat','img_name') % load image from data.mat
else
    img_name = 'pout.tif'; % default image is cameraman.tif
end
img = imread(img_name);
%% real question code
x=2;
y=2;

% rotate
rotated1 = imrotate(img,90,'nearest');
rotated2 = imrotate(img,180,'bilinear');

subplot(x,y,1),imshow(rotated1),title('rotated 90');
subplot(x,y,2),imshow(rotated2),title('rotated 180');

% resize
resized1 = imresize(img,0.75,'nearest');
resized2 = imresize(img,1.5,'bilinear');

% xd i hacked that 
% i need new figure :D
subplot(x+1,y+1,7),imshow(resized1),title('resized 0.75');
subplot(x,y,4),imshow(resized2),title('resized 1');

if new_figure==1
   subplot(x,y,3),imshow(imrotate(img,270,'bicubic')),title('rotated 270');
   subplot(x,y,4),imshow(imrotate(img,360)),title('rotated 360');
   
   figure,imshow(imresize(img,0.25,'bicubic')),title('resized 0.25');
   figure,imshow(resized1),title('resized 0.75');
   figure,imshow(imresize(img,1.25)),title('resized 1.25');
   figure,imshow(resized2),title('resized 1.5');
end
end