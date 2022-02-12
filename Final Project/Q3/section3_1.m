%%
%it can be used for all other patients
clc
clear
Mask1 = niftiread('00_mask.nii');
Mask2 = niftiread('pat2_label.nii');
B = bwperim(Mask1);%finding the volume boundaries
B=double(B);
B1 = bwperim(Mask2);
B1=double(B1);
%finding the point cloud of volume boundaries
q=1;
for i=1:length(B(:,1,1))
    for j=1:length(B(1,:,1))
        for k=1:length(B(1,1,:))
            if B(i,j,k) ~= 0
                x(q)=i;
                y(q)=j;
                z(q)=k;
                q=q+1;
            end
        end
    end
end
q=1;
for i=1:length(B1(:,1,1))
    for j=1:length(B1(1,:,1))
        for k=1:length(B1(1,1,:))
            if B1(i,j,k) ~= 0
                x1(q)=i;
                y1(q)=j;
                z1(q)=k;
                q=q+1;
            end
        end
    end
end
%creating point clouds
points = cat(3,x,y,z);
ptcloud=pointCloud(points);
points1 = cat(3,x1,y1,z1);
ptcloud1=pointCloud(points1);
%Down sampling for easier regesteration
ptCloudA = pcdownsample(ptcloud,'random',.05);
ptCloudB = pcdownsample(ptcloud1,'random',.05);
%Image registeration using MATLAB built-in functions
tform = pcregistercpd(ptCloudB,ptCloudA);
%finding all the points for interpolation
q=1;
for i=1:length(Mask2(:,1,1))
    for j=1:length(Mask2(1,:,1))
        for k=1:length(Mask2(1,1,:))
            if Mask2(i,j,k) ~= 0
                x4(q)=i;
                y4(q)=j;
                z4(q)=k;
                q=q+1;
            end
        end
    end
end
%interpolation of DDF
x5=linspace(min(tform(:,1),[],'all'),max(tform(:,1),[],'all'),q-1);
y5=linspace(min(tform(:,2),[],'all'),max(tform(:,2),[],'all'),q-1);
points4 = cat(3,x4,y4,z4);
ptcloud4 = pointCloud(points4);
F = scatteredInterpolant(tform(:,1),tform(:,2),tform(:,3));
z5=F(x5,y5);
tform1=zeros(1,q-1,3);
tform1(1,:,:)=[x5;y5;z5]';
movingReg = pctransform(ptcloud4,tform1);
q=1;
for i=1:length(Mask1(:,1,1))
    for j=1:length(Mask1(1,:,1))
        for k=1:length(Mask1(1,1,:))
            if Mask1(i,j,k) ~= 0
                x6(q)=i;
                y6(q)=j;
                z6(q)=k;
                q=q+1;
            end
        end
    end
end
points6=cat(3,x6,y6,z6);
ptcloud6=pointCloud(points6);
figure;
pcshow(movingReg);
figure;
pcshow(ptcloud6);