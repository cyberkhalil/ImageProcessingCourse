%% settings
close all;
clear;
clc;

%% Data
X = -100:10:100;
Y = 2.*X.^2-3.*X+2; 
Z = 3.*X.^2-2.*X+10; 
degrees = [60 90 80 80 70 90 50;80 90 80 40 70 40 50; 80 90 80 90 70 90 50];
I = imread('images\cameraman.tif');
%% control statement

% if CONDITION
%   statements
% elseif  CONDITION
%   statements
% end

if degrees(2) >=90
    disp('Level::Excellent');
elseif degrees(1) >=80
    disp('Level::V. Good');
elseif degrees(1) >=70
    disp('Level::Good');
elseif degrees(1) >=50
    disp('Level::Weak');
else
    disp('Level::Fail');
end

% Useful functions  find isempty ismember contains any 
curStd=degrees(2,:);
[row, col] = find(curStd<50);
if isempty(row)
    av = sum(curStd)/length(curStd); %mean(degrees(1,:));
    disp(['Average is ' num2str(av)]);
end

if ~any(ismember(1:49,curStd))
    av = sum(curStd)/length(curStd); %mean(degrees(1,:));
    disp(['Average is ' num2str(av)]);
end

%% for loop

% for start:end (control statement)
%   statements
% end
% you can use break, continue

%length -- largest dimension, size --- #rows and cols, numel -- #of all
%elements r*c

for r=1:1:size(degrees,1)
    curStd = degrees(r,:);
    [row, col] = find(curStd<50);
    if isempty(row)
        av = sum(curStd)/length(curStd); %mean(degrees(1,:));
        disp(['Student ' num2str(r) ': Average is ' num2str(av)]);
    else
        disp(['Student ' num2str(r) ': Fail']);
    end
end

% example break and cont.
for i=1:50
    if mod(i,2)==0
        continue;
    end
    
    if i>30
        break;
    end
    
    disp(i);
end

%% Plot
f1 = figure('Name', 'Testing plot');
imshow(I);
f2 = figure('Name', 'Testing plot');
plot(X,Y, '-.k');
hold on;
plot(X,Z);
hold off;
xlabel('X values');
ylabel('f(x)');
title('square equation');
legend('Y', 'Z');
grid on;
f3 = figure('Name', 'Testing plot');
scatter(X,Y);

f4 = figure('Name', 'All in one');
subplot(2,2,4);
imshow(I);

subplot(2,2,1);
plot(X,Y, '-.k');
hold on;
plot(X,Z);
hold off;
xlabel('X values');
ylabel('f(x)');
title('square equation');
legend('Y', 'Z');
grid on;

subplot(2,2,2);
scatter(X,Y);

f5 = figure('Name', 'All in one');
block = 64;
count =1;
for i=1:block:size(I,1)
    for j=1:block:size(I, 2)
        curBlock = I(i:i+block-1, j:j+block-1);
        
        subplot(8,8,count);
        imshow(curBlock);
        count = count + 1;
    end
end
    