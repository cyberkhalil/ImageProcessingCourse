function Main(~,~)
%% main settings
close all;clear all;clc;
%% gui code
figure('Name','HomeWork 5','Position',[400 100 600 500]);

imgs_list=["cameraman.tif","pout.tif","tire.tif",        ...
            "moon.tif","mri.tif","eight.tif","bag.png"];
        
cimg = uicontrol('Style','popupmenu','String',imgs_list  ...
    ,'Position',[240 450 120 40],'CallBack',{@show_img});

if isfile('data.mat')
    load('data.mat','img_name') % load image from data.mat
    idx = imgs_list == img_name;
    imgs_list(idx) = [];
    imgs_list = [img_name ,imgs_list];
    set(cimg,"String",imgs_list);
end

uicontrol('Style','togglebutton',"String","new figure"   ...
    ,'Position',[530 410 70 30]                          ...
    ,"Callback",{@set_in_new_figure});

uicontrol('Position',[2 400 80 30],"String"              ...
    ,"see original","CallBack",{@show_img});
uicontrol('Position',[110 5 120 40],"String"             ...
    ,"Question 1","CallBack",{@Question1,0});
uicontrol('Position',[250 5 120 40],"String"             ...
    ,"Question 2","CallBack",{@Question2,0});
uicontrol('Position',[390 5 120 40],"String"             ...
    ,"Question 3","CallBack",{@Question3,0});

show_img(cimg);

    function show_img(cimg,~)
        if cimg.String == "see original"
            cimg=cimg.Parent.Children(6);
        end
        % get the first value from cell
        img_name = cell2mat(cimg.String(cimg.Value));
        % show it
        subplot(1,1,1),imshow(img_name);
        % save the value to use it in other questions
        save('data.mat',"img_name","img_name");
    end

    function set_in_new_figure(head,~)
        if head.Value==1
            head.Parent.Children(1).Callback(2) = {1};
            head.Parent.Children(2).Callback(2) = {1};
            head.Parent.Children(3).Callback(2) = {1};
        else
            head.Parent.Children(1).Callback(2) = {0};
            head.Parent.Children(2).Callback(2) = {0};
            head.Parent.Children(3).Callback(2) = {0}; 
        end
    end
end