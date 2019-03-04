%% Normal Methods
close all;
clear;
clc;


## Mod method to get the mod (3 mod 2 = 1)
rem = mod(15,4);

## bit anding oring xoring
band = bitand(8,10);
bor = bitor(1,2);
bxor = bxor(3,3);

## Maximum Values for numerical datatypes ..
w=realmax; # same result as realmax() and as realmax('double').
z=intmax; # same result as intmax() and intmax('int32')

a = realmax('single'); # 3.4028e+38


xL = logical(x); % any number ~=0 set to 1

## Create random numbers

r = rand(1, 100); % rows , coloms % it allows x,y,z too

ri = randi([20,80], 1, 100); % range , rows , coloums % range,x,y,z too
ri = randi(80,1, 100); % range is [1->80]

rn = randn(1, 10000); % idk

% save and load
save('data.mat');
save('data_1.mat', 'Std_1', 'c');

%% load
load('data.mat');

%% functions
function [sum, sub, mult, prod, div] = lab_02_intro_03(array1,array2)

sum = array1+array2;
sub = array1-array2;

mult = array1*array2;
prod = crosspro(array1,array2);% element-wise

div = array1./array2;
end

function prod = crosspro(a1,a2)
prod = a1.*a2;% element-wise
end

# disp : to display string/somthing else on the screen.
disp("Hello");

# tic toc : to get the Elapsed time in seconds from tic to toc.
tic 
x = [1:300];
y = x.*2;
toc

# isempty : determines if the array is empty or not (return 1 if empty 0 if not)

isempty([]); # result = 1
isempty([1:2]) # result = 0


# sum : give the sum for an array , sum([10 20]) == 30 not sum(10,20,...).

sum([10 20]); # result is 30
sum([1 1 1 1]); # result is 4


# mean : give the avarage for an array.

mean([100 90]) # result is 95
mean([100 90 80 70 100 90 80 90 90 90]); # result is 88


# num2str : from numbers to strings. (without it number change to char)

["Hello " num2str(123)]; #result is "Hello 123"


# find : get the index that validate a condition.
find([1 2 3] > 1); # result is [2 3]


# max : get the max value in array.
max([1 2 3 10]); # result is 10


# length : get the maximum length (max([width,height,... etc]));
length([1 2 3 4 5]); # result is 5
length([1 2 3;4 5 6;7 8 9]); # result is 3
length([1;4;7]); # result is 3


# any : return 1 if any thing in array row is not 0
any([1 0]); # result is 1
any([-1 0]); # result is 1
any([0 0]); # result is 0
any([1 0;0 0]); # result is 1 0
any([0 0 [1 0]]); # result is 1


# ismember : return 1 for the index of the wanted members.
ismember([1 2 3],1); # result is 1 0 0
ismember([1 2 3],4); # result is 0 0 0
ismember([1:9],[1 9]); # result is 1 0 0 0 0 0 0 0 1

# size : return the (x,y) size of the array.
size([]); # result is 0 0
size([1]); # result is 1 1
size([1 2 3;4 5 6]); #result is 2 3