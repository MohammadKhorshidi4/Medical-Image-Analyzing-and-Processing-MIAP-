%%
%Section One Part One
clc
clear
X1=imread('Mri1.bmp');
X2=imread('Mri2.bmp');
X3=imread('Mri3.bmp');
X4=imread('Mri4.bmp');
X5=imread('Mri5.bmp');
X6=cat(3,X1,X2,X3);
X7=cat(3,X5,X4,X2);
figure;
imshowpair(X6,X7,'montage');

%%
%Section One Part Two
clc
clear
X1=imread('Mri1.bmp');
X2=imread('Mri2.bmp');
X3=imread('Mri3.bmp');
X4=imread('Mri4.bmp');
X5=imread('Mri5.bmp');

X11=im2double(X1);
Xd1=[X11(:)];
opti=[5 NaN NaN 0];
[center,U,obj_fcn] = fcm(Xd1,4,opti);
fcmI1=U(1,:);
fcmI2=U(2,:);
fcmI3=U(3,:);
fcmI4=U(4,:);
im1 = reshape(fcmI1,256,256);
im2 = reshape(fcmI2,256,256);
im3 = reshape(fcmI3,256,256);
im4 = reshape(fcmI4,256,256);
figure;
sgtitle('Brain1 Segmentaion With m=5');
subplot(2,2,1);
imshow(im1,[]);
subplot(2,2,2);
imshow(im2,[]);
subplot(2,2,3);
imshow(im3,[]);
subplot(2,2,4);
imshow(im4,[]);

X11=im2double(X2);
Xd1=[X11(:)];
opti=[5 NaN NaN 0];
[center,U,obj_fcn] = fcm(Xd1,4,opti);

fcmI1=U(1,:);
fcmI2=U(2,:);
fcmI3=U(3,:);
fcmI4=U(4,:);
im1 = reshape(fcmI1,256,256);
im2 = reshape(fcmI2,256,256);
im3 = reshape(fcmI3,256,256);
im4 = reshape(fcmI4,256,256);
figure;
sgtitle('Brain2 Segmentaion With m=5');
subplot(2,2,1);
imshow(im1,[]);
subplot(2,2,2);
imshow(im2,[]);
subplot(2,2,3);
imshow(im3,[]);
subplot(2,2,4);
imshow(im4,[]);

X11=im2double(X3);
Xd1=[X11(:)];
opti=[5 NaN NaN 0];
[center,U,obj_fcn] = fcm(Xd1,4,opti);

fcmI1=U(1,:);
fcmI2=U(2,:);
fcmI3=U(3,:);
fcmI4=U(4,:);
im1 = reshape(fcmI1,256,256);
im2 = reshape(fcmI2,256,256);
im3 = reshape(fcmI3,256,256);
im4 = reshape(fcmI4,256,256);
figure;
sgtitle('Brain3 Segmentaion With m=5');
subplot(2,2,1);
imshow(im1,[]);
subplot(2,2,2);
imshow(im2,[]);
subplot(2,2,3);
imshow(im3,[]);
subplot(2,2,4);
imshow(im4,[]);

X11=im2double(X4);
Xd1=[X11(:)];
opti=[5 NaN NaN 0];
[center,U,obj_fcn] = fcm(Xd1,4,opti);

fcmI1=U(1,:);
fcmI2=U(2,:);
fcmI3=U(3,:);
fcmI4=U(4,:);
im1 = reshape(fcmI1,256,256);
im2 = reshape(fcmI2,256,256);
im3 = reshape(fcmI3,256,256);
im4 = reshape(fcmI4,256,256);
figure;
sgtitle('Brain4 Segmentaion With m=5');
subplot(2,2,1);
imshow(im1,[]);
subplot(2,2,2);
imshow(im2,[]);
subplot(2,2,3);
imshow(im3,[]);
subplot(2,2,4);
imshow(im4,[]);

X11=im2double(X5);
Xd1=[X11(:)];
opti=[5 NaN NaN 0];
[center,U,obj_fcn] = fcm(Xd1,4,opti);

fcmI1=U(1,:);
fcmI2=U(2,:);
fcmI3=U(3,:);
fcmI4=U(4,:);
im1 = reshape(fcmI1,256,256);
im2 = reshape(fcmI2,256,256);
im3 = reshape(fcmI3,256,256);
im4 = reshape(fcmI4,256,256);
figure;
sgtitle('Brain5 Segmentaion With m=5');
subplot(2,2,1);
imshow(im1,[]);
subplot(2,2,2);
imshow(im2,[]);
subplot(2,2,3);
imshow(im3,[]);
subplot(2,2,4);
imshow(im4,[]);

X11=im2double(X1);
Xd1=[X11(:)];
opti=[1.4 NaN NaN 0];
[center,U,obj_fcn] = fcm(Xd1,4,opti);
fcmI1=U(1,:);
fcmI2=U(2,:);
fcmI3=U(3,:);
fcmI4=U(4,:);
im1 = reshape(fcmI1,256,256);
im2 = reshape(fcmI2,256,256);
im3 = reshape(fcmI3,256,256);
im4 = reshape(fcmI4,256,256);
figure;
sgtitle('Brain1 Segmentaion With m=1.4');
subplot(2,2,1);
imshow(im1,[]);
subplot(2,2,2);
imshow(im2,[]);
subplot(2,2,3);
imshow(im3,[]);
subplot(2,2,4);
imshow(im4,[]);

X11=im2double(X2);
Xd1=[X11(:)];
[center,U,obj_fcn] = fcm(Xd1,4,opti);

fcmI1=U(1,:);
fcmI2=U(2,:);
fcmI3=U(3,:);
fcmI4=U(4,:);
im1 = reshape(fcmI1,256,256);
im2 = reshape(fcmI2,256,256);
im3 = reshape(fcmI3,256,256);
im4 = reshape(fcmI4,256,256);
figure;
sgtitle('Brain2 Segmentaion With m=1.4');
subplot(2,2,1);
imshow(im1,[]);
subplot(2,2,2);
imshow(im2,[]);
subplot(2,2,3);
imshow(im3,[]);
subplot(2,2,4);
imshow(im4,[]);

X11=im2double(X3);
Xd1=[X11(:)];
[center,U,obj_fcn] = fcm(Xd1,4,opti);

fcmI1=U(1,:);
fcmI2=U(2,:);
fcmI3=U(3,:);
fcmI4=U(4,:);
im1 = reshape(fcmI1,256,256);
im2 = reshape(fcmI2,256,256);
im3 = reshape(fcmI3,256,256);
im4 = reshape(fcmI4,256,256);
figure;
sgtitle('Brain3 Segmentaion With m=1.4');
subplot(2,2,1);
imshow(im1,[]);
subplot(2,2,2);
imshow(im2,[]);
subplot(2,2,3);
imshow(im3,[]);
subplot(2,2,4);
imshow(im4,[]);

X11=im2double(X4);
Xd1=[X11(:)];
[center,U,obj_fcn] = fcm(Xd1,4,opti);

fcmI1=U(1,:);
fcmI2=U(2,:);
fcmI3=U(3,:);
fcmI4=U(4,:);
im1 = reshape(fcmI1,256,256);
im2 = reshape(fcmI2,256,256);
im3 = reshape(fcmI3,256,256);
im4 = reshape(fcmI4,256,256);
figure;
sgtitle('Brain4 Segmentaion With m=1.4');
subplot(2,2,1);
imshow(im1,[]);
subplot(2,2,2);
imshow(im2,[]);
subplot(2,2,3);
imshow(im3,[]);
subplot(2,2,4);
imshow(im4,[]);

X11=im2double(X5);
Xd1=[X11(:)];
[center,U,obj_fcn] = fcm(Xd1,4,opti);

fcmI1=U(1,:);
fcmI2=U(2,:);
fcmI3=U(3,:);
fcmI4=U(4,:);
im1 = reshape(fcmI1,256,256);
im2 = reshape(fcmI2,256,256);
im3 = reshape(fcmI3,256,256);
im4 = reshape(fcmI4,256,256);
figure;
sgtitle('Brain5 Segmentaion With m=1.4');
subplot(2,2,1);
imshow(im1,[]);
subplot(2,2,2);
imshow(im2,[]);
subplot(2,2,3);
imshow(im3,[]);
subplot(2,2,4);
imshow(im4,[]);

X11=im2double(X1);
Xd1=[X11(:)];
opti=[1.09 NaN NaN 0];
[center,U,obj_fcn] = fcm(Xd1,4,opti);
maxU = max(U);
index1 = find(U(1,:) == maxU);
index2 = find(U(2,:) == maxU);
index3 = find(U(3,:) == maxU);
index4 = find(U(4,:) == maxU);
fcmImage1(1:length(Xd1))=0;
fcmImage2(1:length(Xd1))=0;
fcmImage3(1:length(Xd1))=0;
fcmImage4(1:length(Xd1))=0;
fcmImage1(index1)= 1;
fcmImage2(index2)= 1;
fcmImage3(index3)= 1;
fcmImage4(index4)= 1;
im1 = reshape(fcmImage1,256,256);
im2 = reshape(fcmImage2,256,256);
im3 = reshape(fcmImage3,256,256);
im4 = reshape(fcmImage4,256,256);
figure;
sgtitle('Brain1 Segmentaion With m=1');
subplot(2,2,1);
imshow(im1,[]);
subplot(2,2,2);
imshow(im2,[]);
subplot(2,2,3);
imshow(im3,[]);
subplot(2,2,4);
imshow(im4,[]);

X11=im2double(X2);
Xd1=[X11(:)];
[center,U,obj_fcn] = fcm(Xd1,4,opti);

maxU = max(U);
index1 = find(U(1,:) == maxU);
index2 = find(U(2,:) == maxU);
index3 = find(U(3,:) == maxU);
index4 = find(U(4,:) == maxU);
fcmImage1(1:length(Xd1))=0;
fcmImage2(1:length(Xd1))=0;
fcmImage3(1:length(Xd1))=0;
fcmImage4(1:length(Xd1))=0;
fcmImage1(index1)= 1;
fcmImage2(index2)= 1;
fcmImage3(index3)= 1;
fcmImage4(index4)= 1;
im1 = reshape(fcmImage1,256,256);
im2 = reshape(fcmImage2,256,256);
im3 = reshape(fcmImage3,256,256);
im4 = reshape(fcmImage4,256,256);
figure;
sgtitle('Brain2 Segmentaion With m=1');
subplot(2,2,1);
imshow(im1,[]);
subplot(2,2,2);
imshow(im2,[]);
subplot(2,2,3);
imshow(im3,[]);
subplot(2,2,4);
imshow(im4,[]);

X11=im2double(X3);
Xd1=[X11(:)];
[center,U,obj_fcn] = fcm(Xd1,4,opti);

maxU = max(U);
index1 = find(U(1,:) == maxU);
index2 = find(U(2,:) == maxU);
index3 = find(U(3,:) == maxU);
index4 = find(U(4,:) == maxU);
fcmImage1(1:length(Xd1))=0;
fcmImage2(1:length(Xd1))=0;
fcmImage3(1:length(Xd1))=0;
fcmImage4(1:length(Xd1))=0;
fcmImage1(index1)= 1;
fcmImage2(index2)= 1;
fcmImage3(index3)= 1;
fcmImage4(index4)= 1;
im1 = reshape(fcmImage1,256,256);
im2 = reshape(fcmImage2,256,256);
im3 = reshape(fcmImage3,256,256);
im4 = reshape(fcmImage4,256,256);
figure;
sgtitle('Brain3 Segmentaion With m=1');
subplot(2,2,1);
imshow(im1,[]);
subplot(2,2,2);
imshow(im2,[]);
subplot(2,2,3);
imshow(im3,[]);
subplot(2,2,4);
imshow(im4,[]);

X11=im2double(X4);
Xd1=[X11(:)];
[center,U,obj_fcn] = fcm(Xd1,4,opti);

maxU = max(U);
index1 = find(U(1,:) == maxU);
index2 = find(U(2,:) == maxU);
index3 = find(U(3,:) == maxU);
index4 = find(U(4,:) == maxU);
fcmImage1(1:length(Xd1))=0;
fcmImage2(1:length(Xd1))=0;
fcmImage3(1:length(Xd1))=0;
fcmImage4(1:length(Xd1))=0;
fcmImage1(index1)= 1;
fcmImage2(index2)= 1;
fcmImage3(index3)= 1;
fcmImage4(index4)= 1;
im1 = reshape(fcmImage1,256,256);
im2 = reshape(fcmImage2,256,256);
im3 = reshape(fcmImage3,256,256);
im4 = reshape(fcmImage4,256,256);
figure;
sgtitle('Brain4 Segmentaion With m=1');
subplot(2,2,1);
imshow(im1,[]);
subplot(2,2,2);
imshow(im2,[]);
subplot(2,2,3);
imshow(im3,[]);
subplot(2,2,4);
imshow(im4,[]);

X11=im2double(X5);
Xd1=[X11(:)];
[center,U,obj_fcn] = fcm(Xd1,4,opti);

maxU = max(U);
index1 = find(U(1,:) == maxU);
index2 = find(U(2,:) == maxU);
index3 = find(U(3,:) == maxU);
index4 = find(U(4,:) == maxU);
fcmImage1(1:length(Xd1))=0;
fcmImage2(1:length(Xd1))=0;
fcmImage3(1:length(Xd1))=0;
fcmImage4(1:length(Xd1))=0;
fcmImage1(index1)= 1;
fcmImage2(index2)= 1;
fcmImage3(index3)= 1;
fcmImage4(index4)= 1;
im1 = reshape(fcmImage1,256,256);
im2 = reshape(fcmImage2,256,256);
im3 = reshape(fcmImage3,256,256);
im4 = reshape(fcmImage4,256,256);
figure;
sgtitle('Brain5 Segmentaion With m=1');
subplot(2,2,1);
imshow(im1,[]);
subplot(2,2,2);
imshow(im2,[]);
subplot(2,2,3);
imshow(im3,[]);
subplot(2,2,4);
imshow(im4,[]);








% imne=cat(3,imagNew1,imagNew2,imagNew3,imagNew4);
% figure;
% subplot(2,2,1);
% imshow(imagNew1,[]);
% subplot(2,2,2);
% imshow(imagNew2,[]);
% subplot(2,2,3);
% imshow(imagNew3,[]);
% subplot(2,2,4);
% imshow(imagNew4,[]);
%%
%Section One Part Three
clc
clear
X1=imread('Mri1.bmp');
X2=imread('Mri2.bmp');
X3=imread('Mri3.bmp');
X4=imread('Mri4.bmp');
X5=imread('Mri5.bmp');

[L1,Centers]=imsegkmeans(X1,4);
B1 = labeloverlay(X1,L1);
[L2,Centers]=imsegkmeans(X2,4);
B2 = labeloverlay(X2,L2);
[L3,Centers]=imsegkmeans(X3,4);
B3 = labeloverlay(X3,L3);
[L4,Centers]=imsegkmeans(X4,4);
B4 = labeloverlay(X4,L4);
[L5,Centers]=imsegkmeans(X5,4);
B5 = labeloverlay(X5,L5);
figure;
imshow(B1)
title('Brain1 Segmentation with K-means')
figure;
imshow(B2)
title('Brain2 Segmentation with K-means')
figure;
imshow(B3)
title('Brain3 Segmentation with K-means')
figure;
imshow(B4)
title('Brain4 Segmentation with K-means')
figure;
imshow(B5)
title('Brain5 Segmentation with K-means')

%%
%Section One Part Four
clc
clear 
X1=imread('Mri1.bmp');
X2=imread('Mri2.bmp');
X3=imread('Mri3.bmp');
X4=imread('Mri4.bmp');
X5=imread('Mri5.bmp');
X11=im2double(X1);
Xd1=[X11(:)];

gm = fitgmdist(Xd1,4,'CovarianceType','diagonal','SharedCovariance',true,'RegularizationValue',0.001);
idx=cluster(gm,Xd1);
cluster1 = (idx == 1);
cluster2 = (idx == 2);
cluster3 = (idx == 3);
cluster4 = (idx == 4);
c1=double(cluster1);
c2=double(cluster2);
c3=double(cluster3);
c4=double(cluster4);
im1 = reshape(c1,256,256);
im2 = reshape(c2,256,256);
im3 = reshape(c3,256,256);
im4 = reshape(c4,256,256);
figure;
sgtitle('Brain1 Segmentaion Using GMM');
subplot(2,2,1);
imshow(im1,[]);
subplot(2,2,2);
imshow(im2,[]);
subplot(2,2,3);
imshow(im3,[]);
subplot(2,2,4);
imshow(im4,[]);

X11=im2double(X2);
Xd1=X11(:);
gm = fitgmdist(Xd1,4,'CovarianceType','diagonal','SharedCovariance',true,'RegularizationValue',0.001);
idx=cluster(gm,Xd1);
cluster1 = (idx == 1);
cluster2 = (idx == 2);
cluster3 = (idx == 3);
cluster4 = (idx == 4);
c1=double(cluster1);
c2=double(cluster2);
c3=double(cluster3);
c4=double(cluster4);
im1 = reshape(c1,256,256);
im2 = reshape(c2,256,256);
im3 = reshape(c3,256,256);
im4 = reshape(c4,256,256);
figure;
sgtitle('Brain2 Segmentaion Using GMM');
subplot(2,2,1);
imshow(im1,[]);
subplot(2,2,2);
imshow(im2,[]);
subplot(2,2,3);
imshow(im3,[]);
subplot(2,2,4);
imshow(im4,[]);

X11=im2double(X3);
Xd1=X11(:);
gm = fitgmdist(Xd1,4,'CovarianceType','diagonal','SharedCovariance',true,'RegularizationValue',0.001);
idx=cluster(gm,Xd1);
cluster1 = (idx == 1);
cluster2 = (idx == 2);
cluster3 = (idx == 3);
cluster4 = (idx == 4);
c1=double(cluster1);
c2=double(cluster2);
c3=double(cluster3);
c4=double(cluster4);
im1 = reshape(c1,256,256);
im2 = reshape(c2,256,256);
im3 = reshape(c3,256,256);
im4 = reshape(c4,256,256);
figure;
sgtitle('Brain3 Segmentaion Using GMM');
subplot(2,2,1);
imshow(im1,[]);
subplot(2,2,2);
imshow(im2,[]);
subplot(2,2,3);
imshow(im3,[]);
subplot(2,2,4);
imshow(im4,[]);

X11=im2double(X4);
Xd1=X11(:);
gm = fitgmdist(Xd1,4,'CovarianceType','diagonal','SharedCovariance',true,'RegularizationValue',0.001);
idx=cluster(gm,Xd1);
cluster1 = (idx == 1);
cluster2 = (idx == 2);
cluster3 = (idx == 3);
cluster4 = (idx == 4);
c1=double(cluster1);
c2=double(cluster2);
c3=double(cluster3);
c4=double(cluster4);
im1 = reshape(c1,256,256);
im2 = reshape(c2,256,256);
im3 = reshape(c3,256,256);
im4 = reshape(c4,256,256);
figure;
sgtitle('Brain4 Segmentaion Using GMM');
subplot(2,2,1);
imshow(im1,[]);
subplot(2,2,2);
imshow(im2,[]);
subplot(2,2,3);
imshow(im3,[]);
subplot(2,2,4);
imshow(im4,[]);

X11=im2double(X5);
Xd1=X11(:);
gm = fitgmdist(Xd1,4,'CovarianceType','diagonal','SharedCovariance',true,'RegularizationValue',0.001);
idx=cluster(gm,Xd1);
cluster1 = (idx == 1);
cluster2 = (idx == 2);
cluster3 = (idx == 3);
cluster4 = (idx == 4);
c1=double(cluster1);
c2=double(cluster2);
c3=double(cluster3);
c4=double(cluster4);
im1 = reshape(c1,256,256);
im2 = reshape(c2,256,256);
im3 = reshape(c3,256,256);
im4 = reshape(c4,256,256);
figure;
sgtitle('Brain5 Segmentaion Using GMM');
subplot(2,2,1);
imshow(im1,[]);
subplot(2,2,2);
imshow(im2,[]);
subplot(2,2,3);
imshow(im3,[]);
subplot(2,2,4);
imshow(im4,[]);

%%
%Section Two
clc
clear 
X1=imread('Blur1.png');
X2=imread('Blur2.png');

[u,v]=GVF(X1,.001,100);
figure;
imshow(u+v);
[u,v]=GVF(X2,.001,100);
figure;
imshow(u+v);
snk
