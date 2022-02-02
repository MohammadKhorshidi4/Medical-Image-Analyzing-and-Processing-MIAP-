%%
clc
clear all
image=imread('Hist.tif');
imh1=histeq(image);
imh2=adapthisteq(image,'NumTiles',[7 7]);
figure
imshowpair(imh1,imh2,'montage')
title('The Histogram Equalization technique on the left & The Adaptive Histogram Equalization technique on the right')
figure;
subplot(3,1,1);
imhist(image,64)
title('The Original Image');
subplot(3,1,2);
imhist(imh1,64)
title('The Histogram Equalization technique');
subplot(3,1,3);
imhist(imh2,64)
title('The Adaptive Histogram Equalization technique');