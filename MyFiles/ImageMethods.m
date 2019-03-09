%% Image Methods.
close all;
clear;
clc;


%%%%%%  double vs im2double  %%%%%%%%%
% The function double() only converts the specified array to a variable of 
% type double, keeping the same values. The function im2double() also 
% normalises to an interval of [0, 1], which is convenient when working 
% with e.g., imshow().
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% imread : Reading images as array.
I = imread('./images/Orange_violet_pansies.jpg');   % 1200x800 (1.0MP)  colored
I = imread('./images/cameraman.jpg');               % 512x512 (0.3MP)   gray
I = imread('./images/Tibia_insulaechorab.jpg');     % 3600x2700 (9.7MP) colored
I = imread('./images/MAGICC_logo_small.jpg');       % 400x400 (0.2MP)   colored

% imshow : to preview the imread data as image inside figure.
imshow(I);
imshow(I, 'InitialMagnification', 'fit');     % fit the sub plot
imshow(I, [],'InitialMagnification', 'fit'); % map to []


% figure : to get a gui with a specific title and images can be shown inside.
figure('Name', 'Testing plot');

% plot : to draw expresions inside a figure
plot([1:10],[2:2:20], '-.k');

% bar : to draw anything as bars (help me & describe more)
bar(1);
bar([9 4 1 0 1 4 9]);

% stem : to draw as steams
stem(1);
stem([9 4 1 0 1 4 9]);

% hold on -> hold off : to make same figure hold more than one plot
hold on;   % next plot will be drawn in the same figure
hold off;  % next plot will be drawn in another figure

% xlabel : to label the x-axis
xlabel('X values');

% ylabel : to label the y-axis
ylabel('f(x)');

% title : to label the figuare
title('square equation');

% grid on : to make the plot background grid
grid on;

% axis : to make the 
axis('square'); % Force a square axis aspect ratio.
axis("equal"); % Force x-axis unit distance to equal y-axis.
axis('normal'); % Restore ratio to default.
axis([0 Inf 0 Inf]); % scale the image

% scatter : to draw exprestion as circles
scatter([1:10],[2:2:20]);

% subplot : to draw another plot in the same figure
subplot(2,2,4);

% legend : work with hold on to make legend preview the expresions' names
legend('Y', 'Z');

% imcomplement : To get the image complement making black->white & white->black
imcomplement(I);

% imadjust : power nthroot
imadjust(I, [], [], 0.5);


% stretchlim : return [low ; high] for an image
x = stretchlim(I);


% imhist : return the histogram for an image
x = imhist(I); % will make a plot with a image for the histogram
x = imhist(I,256); % same as above , the second number is #pins
x = imhist(I,4); % will make the #pins to 4
[x,y] = imhist(I,256); % x as previos , y = 0:255 (= linspace(0, 255, 256))
% see plot(y, x) , bar(x) , stem(x) for more inofrmation about what is y & x

