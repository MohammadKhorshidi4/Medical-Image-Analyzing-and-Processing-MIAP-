%%
%Section One Part One
clear 
clc
city=imread('city_orig.jpg');
citynoise=imread('city_noise.jpg');
y=length(city(:,1));
x=length(city(1,:));
y11=y/2;
x11=x/2;
sp=citynoise(1:y11,1:x11);
nonoise=citynoise(1:y11,x11+1:x);
gaus=citynoise(y11+1:y,x11+1:x);
mix=citynoise(y11+1:y,1:x11);


x12=sp(1,:);
y12=sp(:,1);
x1=city(1,1:x11);
y1=city(1:y11,1);
s1=sum(x1);
s2=sum(y1);
s3=s1+s2;
s4=(s3)^2;
y13=y1-y12;
x13=x1-x12;
s5=sum(y13);
s6=sum(x13);
s7=s5+s6;
s8=(s7)^2;
s9=s4/s8;
SNRsaltandpepper=10*(log(s9))/log(10)


x12=mix(1,:);
y12=mix(:,1);
x1=city(1,1:x11);
y1=city(y11+1:y,1);
s1=sum(x1);
s2=sum(y1);
s3=s1+s2;
s4=(s3)^2;
y13=y1-y12;
x13=x1-x12;
s5=sum(y13);
s6=sum(x13);
s7=s5+s6;
s8=(s7)^2;
s9=s4/s8;
SNRmix=10*(log(s9))/log(10)

x12=gaus(1,:);
y12=gaus(:,1);
x1=city(1,x11+1:x);
y1=city(y11+1:y,1);
s1=sum(x1);
s2=sum(y1);
s3=s1+s2;
s4=(s3)^2;
y13=y1-y12;
x13=x1-x12;
s5=sum(y13);
s6=sum(x13);
s7=s5+s6;
s8=(s7)^2;
s9=s4/s8;
SNRgaussian=10*(log(s9))/log(10)
%%
%Section One Part Two
clear 
clc
city=imread('city_orig.jpg');
citynoise=imread('city_noise.jpg');
y=length(city(:,1));
x=length(city(1,:));
y11=y/2;
x11=x/2;
sp=citynoise(1:y11,1:x11);
nonoise=citynoise(1:y11,x11+1:x);
gaus=citynoise(y11+1:y,x11+1:x);
mix=citynoise(y11+1:y,1:x11);
h=fspecial('average',[3 3]);
spa=imfilter(sp,h);
gausa=imfilter(gaus,h);
mixa=imfilter(mix,h);

x12=spa(1,:);
y12=spa(:,1);
x1=city(1,1:x11);
y1=city(1:y11,1);
s1=sum(x1);
s2=sum(y1);
s3=s1+s2;
s4=(s3)^2;
y13=y1-y12;
x13=x1-x12;
s5=sum(y13);
s6=sum(x13);
s7=s5+s6;
s8=(s7)^2;
s9=s4/s8;
SNR_saltandpepper_averagefilter=10*(log(s9))/log(10)


x12=mixa(1,:);
y12=mixa(:,1);
x1=city(1,1:x11);
y1=city(y11+1:y,1);
s1=sum(x1);
s2=sum(y1);
s3=s1+s2;
s4=(s3)^2;
y13=y1-y12;
x13=x1-x12;
s5=sum(y13);
s6=sum(x13);
s7=s5+s6;
s8=(s7)^2;
s9=s4/s8;
SNRmix_averagefilter=10*(log(s9))/log(10)

x12=gausa(1,:);
y12=gausa(:,1);
x1=city(1,x11+1:x);
y1=city(y11+1:y,1);
s1=sum(x1);
s2=sum(y1);
s3=s1+s2;
s4=(s3)^2;
y13=y1-y12;
x13=x1-x12;
s5=sum(y13);
s6=sum(x13);
s7=s5+s6;
s8=(s7)^2;
s9=s4/s8;
SNRgaussian_averagefilter=10*(log(s9))/log(10)
figure;
imshow(spa);
title('Salt & Pepper noisy filtered by Average filter');
figure;
imshow(mixa);
title('Gaussian & Salt & Pepper Mixture noisy filtered by Average filter');
figure;
imshow(gausa);
title('Gaussian noisy filtered by Average filter');


spg=imgaussfilt(sp);
gausg=imgaussfilt(gaus);
mixg=imgaussfilt(mix);

x12=spg(1,:);
y12=spg(:,1);
x1=city(1,1:x11);
y1=city(1:y11,1);
s1=sum(x1);
s2=sum(y1);
s3=s1+s2;
s4=(s3)^2;
y13=y1-y12;
x13=x1-x12;
s5=sum(y13);
s6=sum(x13);
s7=s5+s6;
s8=(s7)^2;
s9=s4/s8;
SNR_saltandpepper_gaussianfilter=10*(log(s9))/log(10)


x12=mixg(1,:);
y12=mixg(:,1);
x1=city(1,1:x11);
y1=city(y11+1:y,1);
s1=sum(x1);
s2=sum(y1);
s3=s1+s2;
s4=(s3)^2;
y13=y1-y12;
x13=x1-x12;
s5=sum(y13);
s6=sum(x13);
s7=s5+s6;
s8=(s7)^2;
s9=s4/s8;
SNRmix_gaussianfilter=10*(log(s9))/log(10)

x12=gausg(1,:);
y12=gausg(:,1);
x1=city(1,x11+1:x);
y1=city(y11+1:y,1);
s1=sum(x1);
s2=sum(y1);
s3=s1+s2;
s4=(s3)^2;
y13=y1-y12;
x13=x1-x12;
s5=sum(y13);
s6=sum(x13);
s7=s5+s6;
s8=(s7)^2;
s9=s4/s8;
SNRgaussian_gaussianfilter=10*(log(s9))/log(10)
figure;
imshow(spg);
title('Salt & Pepper noisy filtered by Gaussian filter');
figure;
imshow(mixg);
title('Gaussian & Salt & Pepper Mixture noisy filtered by Gaussian filter');
figure;
imshow(gausg);
title('Gaussian noisy filtered by Gaussian filter');

spm=medfilt2(sp);
gausm=medfilt2(gaus);
mixm=medfilt2(mix);

x12=spm(1,:);
y12=spm(:,1);
x1=city(1,1:x11);
y1=city(1:y11,1);
s1=sum(x1);
s2=sum(y1);
s3=s1+s2;
s4=(s3)^2;
y13=y1-y12;
x13=x1-x12;
s5=sum(y13);
s6=sum(x13);
s7=s5+s6;
s8=(s7)^2;
s9=s4/s8;
SNR_saltandpepper_medianfilter=10*(log(s9))/log(10)


x12=mixm(1,:);
y12=mixm(:,1);
x1=city(1,1:x11);
y1=city(y11+1:y,1);
s1=sum(x1);
s2=sum(y1);
s3=s1+s2;
s4=(s3)^2;
y13=y1-y12;
x13=x1-x12;
s5=sum(y13);
s6=sum(x13);
s7=s5+s6;
s8=(s7)^2;
s9=s4/s8;
SNRmix_medianfilter=10*(log(s9))/log(10)

x12=gausm(1,:);
y12=gausm(:,1);
x1=city(1,x11+1:x);
y1=city(y11+1:y,1);
s1=sum(x1);
s2=sum(y1);
s3=s1+s2;
s4=(s3)^2;
y13=y1-y12;
x13=x1-x12;
s5=sum(y13);
s6=sum(x13);
s7=s5+s6;
s8=(s7)^2;
s9=s4/s8;
SNRgaussian_medianfilter=10*(log(s9))/log(10)
figure;
imshow(spm);
title('Salt & Pepper noisy filtered by Median filter');
figure;
imshow(mixm);
title('Gaussian & Salt & Pepper Mixture noisy filtered by Median filter');
figure;
imshow(gausm);
title('Gaussian noisy filtered by Median filter');

%%
%Section Two Part One
clear
clc
hand=imread('hand_xray.jpg');
Y=fft2(hand);
Ys=fftshift(Y);
Ps=10*log10((abs(Ys).^2));
figure;
imagesc(Ps);
title('Image Spectral Density(dB)');
%%
%Section Two Part Two
clear
clc
hand=imread('hand_xray.jpg');
hand1=im2double(hand);
Y=fft2(hand);
Ys=fftshift(Y);
Ps=(abs(Ys));
m1=sum(hand1);
m2=sum(m1);

m3=mean(Ps);
m4=mean(m3);

Pixels_mean=m2/1700
Spectral_mean=m4/1700
%%
%Section Three Part One
clc
clear

chess=imread('chessboard.jpg');
figure;
imshow(chess)
title('main image');
h1=[1,-1];
H1=imfilter(chess,h1);
figure;
imshow(H1)
title('first filter');
h2=[1,0];
H2=imfilter(chess,h2);
figure;
imshow(H2)
title('second filter');
h3=[1,0,-1];
H3=imfilter(chess,h3);
figure;
imshow(H3)
title('third filter');
h4=transpose([1,0,-1]);
H4=imfilter(chess,h4);
figure;
imshow(H4)
title('fourth filter');
h5= [-1,-1,-1;-1,8,-1;-1,-1,-1];
H5=imfilter(chess,h5);
figure;
imshow(H5)
title('fifth filter');

%%
%Section Three Part Two
clc
clear

chess=imread('chessboard.jpg');
chess=rgb2gray(chess);
figure;
imshow(chess)
title('main image');
BW2=edge(chess,'Canny');
figure;
imshow(BW2);
title('Canny edge detector');
BW3=edge(chess,'Sobel');
figure;
imshow(BW3);
title('Sobel edge detector');
BW1=edge(chess,'log');
figure;
imshow(BW1);
title('Laplacian of gaussian edge detector');

%%
%Section Four
clear
clc
hand=imread('hand_xray.jpg');
x=length(hand(:,1));
y=length(hand(1,:));
Y=zeros(x,y);
Y=uint8(Y);
for i=1:x
    for j=1:y
        m1=mod(-i,x)+1;
        m2=mod(-j,y)+1;
        Y(i,j)=hand(m1,m2);
    end
end
figure;
imshow(hand);
title('main image');
figure;
imshow(Y);
title('rotated image');

%%
%Section Five
clear 
clc
hand1=imread('hand_xray.jpg');
brain1=imread('brain_xray.jpg');
hand=im2double(hand1);
brain=im2double(brain1);
Y1=fft2(hand);
Y2=fft2(brain);
m1p2=zeros(900,800);
m2p1=zeros(900,800);
p1=angle(Y1);
m1=abs(Y1);
p2=angle(Y2);
m2=abs(Y2);
for t=1:900
    for r=1:800
        m1p2(t,r)=(m1(t,r))*exp(1i*p2(t,r));
        m2p1(t,r)=(m2(t,r))*exp(1i*p1(t,r));
    end
end
M1P2=ifft2(m1p2);
M2P1=ifft2(m2p1);
figure;
imshow(abs(M1P2));
title('Magnitude of Hand & Phase of Brain');
figure;
imshow(abs(M2P1));
title('Magnitude of Brain & Phase of Hand');
figure;
imshow(hand1);
title('Original Hand Image');
figure;
imshow(brain1);
title('Original Brain Image');

%%
%Section Six Part One
clear
clc
wall=imread('wall.jpg');
wall3=im2gray(wall);
wall2=im2double(wall3);
Y=fft2(wall2);
[M N]=size(wall2);
H=zeros(M,N);
Y=fftshift(Y);
for i=1:M
    for j=1:N
        z=i-(M+1)/2;
        t=j-(N+1)/2;
        c=sqrt((z^2)+(t^2));
        if c<=30
            H(i,j)=300;
        end
    end
end
Y1=Y.*H;
wall1=abs(ifft2(Y1));
wall1=uint8(wall1);
figure;
imshow(Y);
title('Fourier of Image')
figure;
imshow(wall1)
title('Filtered Image');
figure;
imshow(H);
title('The Filter');
figure;
imshow(wall3);
title('Original Image')

%%
%Section Six Part Three
clear
clc
wall=imread('wall.jpg');
wall3=im2gray(wall);
wall2=im2double(wall3);
Y=fft2(wall2);
[M N]=size(wall2);
H=zeros(M,N);
Y=fftshift(Y);
for i=1:M
    for j=1:N
        z=i-(M+1)/2;
        t=j-(N+1)/2;
        c=sqrt((z^2)+(t^2));
        if c>30
            H(i,j)=300;
        end
    end
end
Y1=Y.*H;
wall1=abs(ifft2(Y1));
wall1=uint8(wall1);
figure;
imshow(wall1)
title('Filtered Image');
figure;
imshow(H);
title('The Filter');
figure;
imshow(wall3);
title('Original Image')
%%
%Section Six Part Four
clear
clc
wall=imread('wall.jpg');
wall3=im2gray(wall);
wall2=im2double(wall3);
Y=fft2(wall2);
[M N]=size(wall2);
H1=zeros(M,N);
H2=zeros(M,N);
Y=fftshift(Y);
d0=30;
for i=1:M
    for j=1:N
        z=i-(M+1)/2;
        t=j-(N+1)/2;
        c=sqrt((z^2)+(t^2));
        H1(i,j)=5/(1+(d0/c)^4);
    end
end
for i=1:M
    for j=1:N
        z=i-(M+1)/2;
        t=j-(N+1)/2;
        c=(z^2)+(t^2);
        H2(i,j)=1-exp(-(c/((d0)^2)));
    end
end
Y1=Y.*H1;
wallb=abs(ifft2(Y1));
Y2=Y.*H2;
wallg=abs(ifft2(Y2));
H3=fspecial('laplacian',.5);
wallL=imfilter(wall3,H3);
figure;
imshow(wallb,[])
title('Butterworth Filtered Image(n=2)');
figure;
imshow(H1);
title('Butterworth Filter');
figure;
imshow(wallg,[]);
title('Gaussian Filtered Image')
figure;
imshow(H2);
title('Gaussian Filter');
figure;
imshow(wallL,[])
title('Laplacian Filtered Image');
figure;
imshow(H3);
title('Laplacian Filter');