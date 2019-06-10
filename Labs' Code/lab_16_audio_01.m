%close all;
clear all;
clc;

Fs = 44100; %sample rate
nBits = 16; % number of bits 
nChannels = 1; %number of channels

%audio object
rec_obj = audiorecorder(Fs,nBits,nChannels);

%record
disp('Start Recording');
recordblocking(rec_obj,5);
disp('End Recording');

%audio data
myRecording = getaudiodata(rec_obj);

%play
play(rec_obj);

%show signal
figure;
plot([1:numel(myRecording)]/Fs,myRecording);

%save audio
audiowrite('test.wav', myRecording, Fs);