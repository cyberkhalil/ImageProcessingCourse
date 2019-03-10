function Question2(h,evt,f)
% h and evt are unused but is written for matlab compilability

x = 3; % number of images on x axsis
y = 3; % number of images on y axsis

% show original image
subplot(x,y,1);
imshow(f);
title('Original');

for i=1:8
subplot(x,y,i+1);

if exist('OCTAVE_VERSION', 'builtin')
    % in octave
    imshow(bitget(f,i));
else
    %  in matlab
    imshow(bitget(double(f),i,'uint8'));
end

title([num2str(i) '-bit plane']);
disp([num2str(i) '-bit plane done'])
end
end