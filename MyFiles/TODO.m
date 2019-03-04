%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[h, l] = imhist(f, 64); % linspace(0, 255, 64);

% plot using imhist
subplot(1,5,2);
imhist(f, 64);
%axis('square'); %'square

%plot using plot
subplot(1,5,3);
plot(l, h);
axis('square');
axis([0 Inf 0 Inf]);

%plot using bar
subplot(1,5,4);
bar(h);
axis('square');
axis([0 Inf 0 Inf]);

%plot using stem
subplot(1,5,5);
stem(h);
axis('square');
axis([0 Inf 0 Inf]);


%%%%%%
subplot(2,5,6);
imhist(f);
axis([0 Inf 0 Inf]);
%%%%%%
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