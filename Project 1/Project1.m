%%
%Histogram Equalization Technique
%In This Technique, we are going to denoise a picture with Distribute the image histogram evenly 
%and increase the contrast of the image.
clc
clear all
image=imread('Hist.tif');
imh1=histeq(image);%This will be deploy Histogram Equalization Technique once in a time to the all of the pixels
imh2=adapthisteq(image,'NumTiles',[7 7]);%This will be deploy Histogram Equalization Technique with specific windows
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

%%
%Some Primary Denoising Techniques
%In this section, I am going to add  different noises to a picture from heart 
%and denoise it with some primary techniques. to find wich technique is better for specific noise.
clc
clear all
image=imread('heart_ct.jpg');
image=rgb2gray(image);
imnoi1=imnoise(image,'salt & pepper',0.02);
imnoi2=imnoise(image,'gaussian',0.05,0.05);
imnoi3=imnoise(image,'salt & pepper',0.04);
imnoi4=imnoise(image,'gaussian',0.05,0.10);
imnoi5=imnoise(image,'salt & pepper',0.12);
imnoi6=imnoise(image,'gaussian',0.1,0.25);
h1 = fspecial('average',3);
h2 = fspecial('average',5);
h3 = fspecial('average',7);
imf11=imfilter(imnoi1,h1);
imf12=imfilter(imnoi1,h2);
imf13=imfilter(imnoi1,h3);
imf21=imfilter(imnoi2,h1);
imf22=imfilter(imnoi2,h2);
imf23=imfilter(imnoi2,h3);
imf31=imfilter(imnoi3,h1);
imf32=imfilter(imnoi3,h2);
imf33=imfilter(imnoi3,h3);
imf41=imfilter(imnoi4,h1);
imf42=imfilter(imnoi4,h2);
imf43=imfilter(imnoi4,h3);
imf51=imfilter(imnoi5,h1);
imf52=imfilter(imnoi5,h2);
imf53=imfilter(imnoi5,h3);
imf61=imfilter(imnoi6,h1);
imf62=imfilter(imnoi6,h2);
imf63=imfilter(imnoi6,h3);
figure;
montage({imnoi1,imnoi2})
title('The Noise on the left Image is the salt & pepper noise with d=0.02');
xlabel('The Noise on the right Image is the white gaussian noise with median=0.05 & variance=0.05')
figure;
montage({imnoi3,imnoi4})
title('The Noise on the left Image is the salt & pepper noise with d=0.04');
xlabel('The Noise on the right Image is the white gaussian noise with median=0.05 & variance=0.10')
figure;
montage({imnoi5,imnoi6})
title('The Noise on the left Image is the salt & pepper noise with d=0.12');
xlabel('The Noise on the right Image is the white gaussian noise with median=0.1 & variance=0.25')
figure;
montage({imnoi1,imf11,imf12,imf13})
title('The salt & pepper noisy image with d=0.02 on the left & the filtered image with size=3 on the right');
xlabel('the filtered image with size=5 on the left & the filtered image with size=7 on the right')
figure;
montage({imnoi2,imf21,imf22,imf23})
title('The gaussian noisy image with median=0.05 & variance=0.05 on the left & the filtered image with size=3 on the right');
xlabel('the filtered image with size=5 on the left & the filtered image with size=7 on the right')
figure;
montage({imnoi3,imf31,imf32,imf33})
title('The salt & pepper noisy image with d=0.04 on the left & the filtered image with size=3 on the right');
xlabel('the filtered image with size=5 on the left & the filtered image with size=7 on the right')
figure;
montage({imnoi4,imf41,imf42,imf43})
title('The gaussian noisy image with median=0.05 & variance=0.10 on the left & the filtered image with size=3 on the right');
xlabel('the filtered image with size=5 on the left & the filtered image with size=7 on the right')
figure;
montage({imnoi5,imf51,imf52,imf53})
title('The salt & pepper noisy image with d=0.12 on the left & the filtered image with size=3 on the right');
xlabel('the filtered image with size=5 on the left & the filtered image with size=7 on the right')
figure;
montage({imnoi6,imf61,imf62,imf63})
title('The gaussian noisy image with median=0.10 & variance=0.25 on the left & the filtered image with size=3 on the right');
xlabel('the filtered image with size=5 on the left & the filtered image with size=7 on the right')
%%
%Brightness Level Conversion
%In this section, I am going to use this conversion to see how can I get a better picture from a medical Image.
clc
clear all
image=imread('retina.png');
imf=image;
L=255;
imf=double(imf);
imf2=(L-1)*(imf./L-1).^0.365;
imf=(L-1)*(log(imf+1)./log(L));
imf=uint8(imf);
imf2=uint8(imf2);
figure;
imshow(imf)

figure;
imshow(imf2)

%%
%The area is where the nerves leave the eyeball
%This area is the brightest area in the pictre, 
%and the solution is thresholding but because of the alt and pepper noise, I have to denoise it with average filter.
clc
clear all
image=imread('retina.png');
h = fspecial('average',5);
imf=imfilter(image,h);
imf1=double(imf(:,1));
imf2=double(imf(1,:));
l1=length(imf1);
l2=length(imf2);
for i=1:l1
    for j=1:l2
        if imf(i,j)<210
            imf(i,j)=0;
        end
    end
end
imshow(imf)