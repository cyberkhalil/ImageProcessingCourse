close all;
clear all;
clc;

t1 = tonegen(200,16000,5);
t2 = tonegen(600,16000,5);
t3 = tonegen(1000,16000,5);
t4 = tonegen(10000,16000,5);
soundsc(t1+t2+t3+t4,16000);

noise=rand(1,16000*5);
%soundsc(noise,16000);

