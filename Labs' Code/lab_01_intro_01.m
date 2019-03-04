%% settings
close all;
clear;
clc;

%% variables
x=300; % default double
x1=uint8(x);
x2=int8(x);
x3=int32(x);
y=10.5e10;
w=realmax;
z=intmax;
m=eps;

t=true;
f=false;
xL = logical(x); % any number ~=0 set to 1
%t=1; %wrong -- it assign 1 as double not boolean

char = 'c';
charArray = 'char';

str1 = "s";
str2 = "string";

%% operations 

% + - * / %mod
rem = mod(15,4);
h = int32(500)/int32(1);
% if one of them int , the result is int, round to nearset int value
% two should have same class if integers is used

l1 = 5>3; % > < >= <= == ~=

% and(&) or(|) not(~)
l2 = ~l1;

x=8;
y=10;
z = bitand(x,y);

c = 'hi, ';
str1 = "hello";
str2= " world ";
str = c+ str1+str2;
%str = 'hi, hello world';
str = str2mat(str);
str_sub = str(1:5);






