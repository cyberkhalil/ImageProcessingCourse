function Main(h,evt)
% h and evt are unused but is written for matlab compilability
close;clear;
%% gui code
figure('Name','HomeWork 2','Position',[400 100 600 500]);
% TODO : make choose another image available

imgs_list = ["cameraman.tif","pout.tif","tire.tif","moon.tif","mri.tif","eight.tif","bag.png"];
cimg = uicontrol('Style','popupmenu');
set(cimg,'Position',[240 450 120 40]);
set(cimg,"String",imgs_list);
set(cimg,"CallBack",@show_img);


if isfile('data.mat')
    load('data.mat','img_name') % load image from data.mat
    idx = find(imgs_list == img_name);
    imgs_list(idx) = [];
    imgs_list = [img_name ,imgs_list];
    set(cimg,"String",imgs_list);
end

uicontrol('Position',[60 5 120 40],"String","Question 1","CallBack",{@Question1});
uicontrol('Position',[200 5 90 40],"String","Question 2 A","CallBack",{@Question2_A});
uicontrol('Position',[310 5 90 40],"String","Question 2 B","CallBack",{@Question2_B});
uicontrol('Position',[420 5 120 40],"String","Question 3","CallBack",{@Question3});


show_img(cimg);

function show_img(cimg,event)
    % get the first value from cell
    img_name = cell2mat(cimg.String(cimg.Value));
    % show it
    imshow(img_name);
    % save the value to use it in other questions
    save('data.mat',"img_name","img_name");
end

end