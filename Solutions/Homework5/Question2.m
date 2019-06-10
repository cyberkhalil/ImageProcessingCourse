function Question2(~,~,new_figure)
%% question settings
if nargin==3 % nargin is the number of arraguments
    if new_figure==1
        figure;
    end
end
x=2;
y=2;
% load img
if isfile('data.mat')
    load('data.mat','img_name') % load image from data.mat
else
    img_name = 'pout.tif'; % default image is cameraman.tif
end
img = imread(img_name);

%% function scale
    function [scalled_img,T] = scale(img,x,y)
        T = [   x   0   0;
                0   y   0;
                0   0   1];
            tform_affine2d = affine2d(T);
            scalled_img = imwarp(img,tform_affine2d);
    end
%% function horizental rotate
    function [rotated_img,T] = hz_rotate(img,theta)
        T = [   cos(theta)  sin(theta)   0;
                -sin(theta) cos(theta)   0;
                0           0            1];
            tform_affine2d = affine2d(T);
            rotated_img = imwarp(img,tform_affine2d);
    end
%% function vertical rotate
    function [rotated_img,T] = vt_rotate(img,theta)
        T = [   -1          sin(theta)  0;
                sin(theta)  1           0;
                0           0           1];
            tform_affine2d = affine2d(T);
            rotated_img = imwarp(img,tform_affine2d);
    end
%% real question code
[img1,T1] = scale(img,1.5,1.5);
subplot(x,y,1),imshow(img1 ),title('T1');

[img2,T2] = hz_rotate(img1 ,deg2rad(30));
subplot(x,y,2),imshow(img2),title('T2');

[img3,T3] = vt_rotate(img2,pi);
subplot(x,y,3),imshow(img3),title('T3');

%disp(T1),disp(T2),disp(T3);
T= T1*T2*T3;
T_tform = affine2d(T);
transformed_img = imwarp(img,T_tform);
subplot(x,y,4),imshow(transformed_img),title('T1*T2*T3');
end