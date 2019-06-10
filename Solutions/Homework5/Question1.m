function Question1(~,~,new_figure)
%% question settings
if nargin==3 % nargin is the number of arraguments
    if new_figure==1
        figure;
    end
end
if isfile('data.mat')
    load('data.mat','img_name') % load image from data.mat
else
    img_name = 'pout.tif'; % default image is cameraman.tif
end
img = imread(img_name);

x = 2;
y = 2;
%% real question code
theta = pi/4;
T = [   cos(theta)    sin(theta)   0;
        -1*sin(theta) cos(theta)   0;
        0             0            1];

% Using maketform for affine
tform_maketform = maketform( 'affine', T);
img_maketform = imtransform(img,tform_maketform);
subplot(x,y,1),imshow(img_maketform),title('maketform');

% Using affine2d
tform_affine2d = affine2d(T);
img_affine2d = imwarp(img,tform_affine2d);
subplot(x,y,2),imshow(img_affine2d),title('affine2d');

% Using maketform for projective
tform2 = maketform( 'projective', T);
img_maketform = imtransform(img,tform_maketform);
subplot(x,y,3),imshow(img_maketform),title('maketform');

% Using projective2d
tform_projective2d = projective2d(T);
img_projective2d = imwarp(img,tform_projective2d);
subplot(x,y,4),imshow(img_projective2d),title('projective2d');
end