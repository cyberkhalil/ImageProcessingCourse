function [s]=tonegen(Ft, Fs, Td)
s=sin([1:Fs*Td]*2*pi*Ft/Fs);