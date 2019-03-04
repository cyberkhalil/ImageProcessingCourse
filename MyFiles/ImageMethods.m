%% Image Methods.
close all;
clear;
clc;


######  double vs im2double  #########
# The function double() only converts the specified array to a variable of 
# type double, keeping the same values. The function im2double() also 
# normalises to an interval of [0, 1], which is convenient when working 
# with e.g., imshow().
######################################

# imread : Reading images as array.
I = imread('/home/khalil2535/Octave/lab_session/images/binary/apple-1.gif');
I = imread('/home/khalil2535/Octave/lab_session/images/cameraman.jpg');

# imshow : to preview the imread data as image inside figure.
imshow(I);
imshow(I, 'InitialMagnification', 'fit');     # fit the sub plot
imshow(I, [],'InitialMagnification', 'fit'); # map to []


# figure : to get a gui with a specific title and images can be shown inside.
figure('Name', 'Testing plot');

# plot : to draw expresions inside a figure
plot([1:10],[2:2:20], '-.k');

# hold on -> hold off : to make same figure hold more than one plot
hold on;   # next plot will be drawn in the same figure
hold off;  # next plot will be drawn in another figure

# xlabel : to label the x-axis
xlabel('X values');

# ylabel : to label the y-axis
ylabel('f(x)');

# title : to label the figuare
title('square equation');

# grid on : to make the plot background grid
grid on;

# scatter : to draw exprestion as circles
scatter([1:10],[2:2:20]);

# subplot : to draw another plot in the same figure
subplot(2,2,4);

# legend : work with hold on to make legend preview the expresions' names
legend('Y', 'Z');

# imadjust : power nthroot
imadjust(I, [], [], 0.5);


# stretchlim : return [low ; high] for an image
x = stretchlim(I);


# todo : functions()



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[h, l] = imhist(f, 64); % linspace(0, 255, 64);

% plot using imhist
subplot(1,5,2);
imhist(f, 64);
%axis('square'); %'square

%plot using plot
subplot(1,5,3);
plot(l, h);
axis('square');
axis([0 Inf 0 Inf]);

%plot using bar
subplot(1,5,4);
bar(h);
axis('square');
axis([0 Inf 0 Inf]);

%plot using stem
subplot(1,5,5);
stem(h);
axis('square');
axis([0 Inf 0 Inf]);


%%%%%%
subplot(2,5,6);
imhist(f);
axis([0 Inf 0 Inf]);
%%%%%%
g1 = imcomplement(f);
subplot(2,5,2);
imshow(g1, 'InitialMagnification', 'fit');
title('original image');

subplot(2,5,7);
imhist(g1);
axis([0 Inf 0 Inf]);

%%%%%%
g2 = imadjust(f,[0.3 0.7],[],1);
subplot(2,5,3);
imshow(g2, 'InitialMagnification', 'fit');
title('original image');

subplot(2,5,8);
imhist(g2);
axis([0 Inf 0 Inf]);

%%%%%%
g3 = 1./(1+(128./double(f)).^4);
subplot(2,5,4);
imshow(g3, 'InitialMagnification', 'fit');
title('original image');

subplot(2,5,9);
imhist(g3);
axis([0 Inf 0 Inf]);

%%%%%%
g4 = 2*log(1+im2double(f));
subplot(2,5,5);
imshow(g4, 'InitialMagnification', 'fit');
title('original image');

subplot(2,5,10);
imhist(g4);
axis([0 Inf 0 Inf]);