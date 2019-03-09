function Question1(h,evt,f)
% h and evt are unused but is written for matlab compilability

x = 2; % number of images on x axsis
y = 3; % number of images on y axsis

g = @(i,s) (floor(i/s)*s) + s/2;
imshowadjusted = @(image , steps_number) imshow(g(image,steps_number*2));

% show original image
subplot(x,y,1);
imshow(f);
title('Original');

for index=2:6
subplot(x,y,index);
imshowadjusted(f,2^index);
title(['Adjusted with step of ' num2str(2^index)]);
disp(['Adjusted with step of ' num2str(2^index) ' done'])
end
end