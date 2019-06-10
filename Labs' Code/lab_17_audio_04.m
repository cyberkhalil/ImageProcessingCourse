close all;
clear all;
clc;

load handel.mat

b = [2 -0.25 -0.25 0.5 -0.25 -0.25 -0.25];
a=1; %max(abs(y(:)));
y_f1 = filter(b,a,y);
%y_f1 = y_f1/max(abs(y_f1));
soundsc(y);
soundsc(y_f1);

a=[1 0.25];
y_f2 = filter(b,a,y);
%y_f2 = y_f2/max(abs(y_f2));
%soundsc(y_f2);
