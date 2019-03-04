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
I = imread('/home/khalil2535/Octave/lab_session/images/binary/apple-1.gif');
I = imread('/home/khalil2535/Octave/lab_session/images/cameraman.jpg');

% imshow : to preview the imread data as image inside figure.
imshow(I);
imshow(I, 'InitialMagnification', 'fit');     % fit the sub plot
imshow(I, [],'InitialMagnification', 'fit'); % map to []


% figure : to get a gui with a specific title and images can be shown inside.
figure('Name', 'Testing plot');

% plot : to draw expresions inside a figure
plot([1:10],[2:2:20], '-.k');

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

% scatter : to draw exprestion as circles
scatter([1:10],[2:2:20]);

% subplot : to draw another plot in the same figure
subplot(2,2,4);

% legend : work with hold on to make legend preview the expresions' names
legend('Y', 'Z');

% imadjust : power nthroot
imadjust(I, [], [], 0.5);


% stretchlim : return [low ; high] for an image
x = stretchlim(I);
