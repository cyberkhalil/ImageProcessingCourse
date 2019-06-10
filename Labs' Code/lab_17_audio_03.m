close all;
clear all;
clc;

load handel.mat
sound(y, Fs);
plot(([1:size(y)]/Fs),y);

% scale -1 to 1
yn1 = y/max(abs(y(:))); % soundsc(y);
sound(yn1, Fs);
plot(([1:size(yn1)]/Fs),yn1);

% scale within a range
soundsc(y, [0 0.4]);

%scale with Fs
soundsc(y, 2*Fs);



