close all;
clear all;
clc;

load handel.mat

filename = 'handel.wav';
audiowrite(filename,y,Fs);
plot([1:size(y)]/Fs,y);
clear y Fs

% just to read audio vector
[y, Fs] = audioread(filename);

%to play an audio object
obj_audio = audioplayer(y,Fs);
play(obj_audio)