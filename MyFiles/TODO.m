%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


g1 = imcomplement(f);
subplot(2,5,2);
imshow(g1, 'InitialMagnification', 'fit');
title('original image');

subplot(2,5,7);
imhist(g1);
axis([0 Inf 0 Inf]);

%%%%%%
g2 = imadjust(f,[0.3 0.7],[],1);
subplot(2,5,3);
imshow(g2, 'InitialMagnification', 'fit');
title('original image');

subplot(2,5,8);
imhist(g2);
axis([0 Inf 0 Inf]);

%%%%%%
g3 = 1./(1+(128./double(f)).^4);
subplot(2,5,4);
imshow(g3, 'InitialMagnification', 'fit');
title('original image');

subplot(2,5,9);
imhist(g3);
axis([0 Inf 0 Inf]);

%%%%%%
g4 = 2*log(1+im2double(f));
subplot(2,5,5);
imshow(g4, 'InitialMagnification', 'fit');
title('original image');

subplot(2,5,10);
imhist(g4);
axis([0 Inf 0 Inf]);