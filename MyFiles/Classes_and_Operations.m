%% settings
close all;
clear;
clc;

%% variables

## Double % max: 1.7977e+308  | min: -1.7977e+308  | real min : 2.2251e-308
x=300;
y=10.5e10;
m=eps;

## int  % no real min

i1 = int8(10);  % max : 127                   | min : -128
i2 = int16(10); % max : 32767                 | min : -32768
i3 = int32(10); % max : 2147483647            | min : -2147483648
i4 = int64(10); % max : 9223372036854775807   | min : -9223372036854775808


## Un signed int %  min : 0 | no real min

u1 = uint8(10);  % max : 255 
u2 = uint16(10); % max : 65535
u3 = uint32(10); % max : 4294967295
u4 = uint64(10); % max : 18446744073709551615


## Logical

t=true;
f=false;

a = true | false & true || ~true & ~!false

## Char & Char Arrays

char = 'c';
charArray = 'char';

str1 = "s";
str2 = "string";

## operations   % + - * /

h = int8(1)/int8(1); % Int's & UInt's must be same datatype for all opertaions

% if one of them int , the result is int, round to nearset int value
% two should have same class if integers is used

l1 = 5>3; % > < >= <= == ~= % seems easy..
%t=1; %wrong -- it assign 1 as double not boolean


% and(&) or(|) not(~) also (!)
l2 = ~l1;

c = 'hi, ';
str1 = "hello";
str2= " world ";
str = [c str1 str2];  % str = 'hi, hello world';

str_sub = str(1:5);


## Arrays % [] array

x = []; %empty array
x = [2, 7, 5, -9];


x = x'; % flip coloums and rows

y = ["Hi ", "MATLAB ", " I am going to enjoy"];
z = [true, false, false, true];


% indexing absolute (r,c)   OR linear 
x_1 = x(1,3);
x_2 = x(3);

w = 10:-0.1:1;

xy= [1:10; 2:2:20; 1.1:0.1:2];

xy_1 = xy(2,6); % (r,c)   R_#r   C_#c   R*(c-1)+r
xy_2 = xy(17); % I_index     r=(I_index-1)%R+1   c= ceil(I_index/R);


# todo more arrays operations

# Cells   %  {} cell

c = {1, 1:10; 'Hi' true};
c_1  = c{1,1};
c_2 = c{2,1};
c_3 = c{3};



% struct
Std_1.Name = "Ahmad";
Std_1.ID = "120015555";
Std_1.Average = 88;