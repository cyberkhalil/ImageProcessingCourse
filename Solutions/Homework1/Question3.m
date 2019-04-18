function Question3(h,evt,f)
% h and evt are unused but is written for matlab compilability
tic
x = 2; % number of images on x axsis
y = 4; % number of images on y axsis
[width , height] = size(f);

f_bin = dec2bin(f);
f_bin_flipped = fliplr(f_bin);

for i=1:8
  
subplot(x,y,i);

f_i_flipped = f_bin_flipped(:,1:i);

f_i = fliplr(f_i_flipped);

f_dec = bin2dec(f_i) * ((2^(9-i))-1);

f_final = reshape(f_dec,width,height);

imshow(uint8(f_final));
title([num2str(i) '-bit']);
disp([num2str(i) '-bit done'])
end
toc
end
