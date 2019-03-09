function Question3(h,evt,f)
% h and evt are unused but is written for matlab compilability

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
end
%%%% PS : the way above is the fastest way i got to do the
%%%% same work , below i used (dec2binvec -> decimalToBinaryVector,
%%%%                             binvec2dec -> binaryVectorToDecimal)
%%%%              methods :
%
%for n=1:2
%    for i=1:512
%        for j=1:512
%            dec_to_bin = fliplr(dec2binvec(double(f(i,j)),8));
%            f_bin = dec_to_bin(1:n);
%            f_bin = fliplr(f_bin);
%            g(i,j) = binvec2dec(permute(f_bin, [3 2 1]));
%        end
%    end
%    subplot(x,y,n);
%    imshow(g);
%end
%