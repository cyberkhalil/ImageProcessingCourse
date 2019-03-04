%% settings
close all;
clear;
clc;

%% load
load('data.mat');

%% arrays, cells, and struct
% [] array
% {} cell

x = []; %empty array
x = [2, 7, 5, -9];
%x = x';
y = ["Hi ", "MATLAB ", " I am going to enjoy"];
z = [true, false, false, true];

% indexing absolute (r,c)   OR linear 
x_1 = x(1,3);
x_2 = x(3);

w = 10:-0.1:1;
r = rand(1, 100);
ri = randi([20,80], 1, 100);
rn = randn(1, 10000);

xy= [1:10; 2:2:20; 1.1:0.1:2];

xy_1 = xy(2,6); % (r,c)   R_#r   C_#c   R*(c-1)+r
xy_2 = xy(17); % I_index     r=(I_index-1)%R+1   c= ceil(I_index/R);

%cell
c = {1, 1:10; 'Hi' true};
c_1  = c{1,1};
c_2 = c{2,1};
c_3 = c{3};

% struct
Std_1.Name = "Ahmad";
Std_1.ID = "120015555";
Std_1.Average = 88;

a1 = randi([1,10], 3,3);
a2 = randi([1,10], 3,3);

[s1, s2, m, p, d] = lab_02_intro_03(a1,a2);

%save and load
save('data.mat');
save('data_1.mat', 'Std_1', 'c');