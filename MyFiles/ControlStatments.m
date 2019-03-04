%% settings
close all;
clear;
clc;

%% Data
X = -100:10:100;
Y = 2.*X.^2-3.*X+2; 
Z = 3.*X.^2-2.*X+10; 
degrees = [60 90 80 80 70 90 50;80 90 80 40 70 40 50; 80 90 80 90 70 90 50];

% if CONDITION
%   statements
% elseif  CONDITION
%   statements
% end

if degrees(2) >=90
    'Level::Excellent'
elseif degrees(1) >=80
    'Level::V. Good'
elseif degrees(1) >=70
    'Level::Good'
elseif degrees(1) >=50
    'Level::Weak'
else
    'Level::Fail'
end
%

%% for loop

% for start:end (control statement)
%   statements
% end
% you can use break, continue

%length -- largest dimension, size --- %rows and cols, numel -- %of all
%elements r*c

for r=1:1:size(degrees,1)
    curStd = degrees(r,:);
    [row, col] = find(curStd<50);
    if isempty(row)
        av = sum(curStd)/length(curStd); %mean(degrees(1,:));
        ['Student ' num2str(r) ': Average is ' num2str(av)]
    else
        ['Student ' num2str(r) ': Fail']
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
    i
end
%