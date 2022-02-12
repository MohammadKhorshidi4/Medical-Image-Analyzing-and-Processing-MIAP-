%%
clc
clear 
%The idea of this section is seperating the lumbar vertebrae and register
%each lumbar vertebra and then concatenate them



Mask1 = niftiread('00_mask.nii');
Mask2=niftiread('pat2_label.nii');
mas=im2double(Mask1);
%Atlas section
r=size(Mask1);
r=[6 r];
p1=zeros(r);
%Seperating the lumbar vertebrae and finding the boundaries
for t=1:6
    o=max(mas,[],'all');
    for i=1:length(mas(:,1,1))
        for j=1:length(mas(1,:,1))
            for k=1:length(mas(1,1,:))
                if mas(i,j,k) == o
                    p1(t,i,j,k)=1;
                    mas(i,j,k)=0;
                end
            end
        end
    end
    B=zeros(size(Mask1));
    B(:,:,:) = bwperim(p1(t,:,:,:));
    B=double(B);
    B=bwperim(B);
    B=double(B);
    p1(t,:,:,:)=B;
end

%finding each lumbar vertebra boundaries point cloud
q=1;
for i=1:length(p1(1,:,1,1))
    for j=1:length(p1(1,1,:,1))
        for k=1:length(p1(1,1,1,:))
            if p1(1,i,j,k)==1
                x1(q)=i;
                y1(q)=j;
                z1(q)=k;
                q=q+1;
            end
        end
    end
end
q=1;
for i=1:length(p1(2,:,1,1))
    for j=1:length(p1(2,1,:,1))
        for k=1:length(p1(2,1,1,:))
            if p1(2,i,j,k)==1
                x2(q)=i;
                y2(q)=j;
                z2(q)=k;
                q=q+1;
            end
        end
    end
end
q=1;
for i=1:length(p1(3,:,1,1))
    for j=1:length(p1(3,1,:,1))
        for k=1:length(p1(3,1,1,:))
            if p1(3,i,j,k)==1
                x3(q)=i;
                y3(q)=j;
                z3(q)=k;
                q=q+1;
            end
        end
    end
end
q=1;
for i=1:length(p1(4,:,1,1))
    for j=1:length(p1(4,1,:,1))
        for k=1:length(p1(4,1,1,:))
            if p1(4,i,j,k)==1
                x4(q)=i;
                y4(q)=j;
                z4(q)=k;
                q=q+1;
            end
        end
    end
end
q=1;
for i=1:length(p1(5,:,1,1))
    for j=1:length(p1(5,1,:,1))
        for k=1:length(p1(5,1,1,:))
            if p1(5,i,j,k)==1
                x5(q)=i;
                y5(q)=j;
                z5(q)=k;
                q=q+1;
            end
        end
    end
end
q=1;
for i=1:length(p1(6,:,1,1))
    for j=1:length(p1(6,1,:,1))
        for k=1:length(p1(6,1,1,:))
            if p1(6,i,j,k)==1
                x6(q)=i;
                y6(q)=j;
                z6(q)=k;
                q=q+1;
            end
        end
    end
end
%creating the point cloud
mL1 = cat(3,x1,y1,z1);
L1=pointCloud(mL1);
mL2 = cat(3,x2,y2,z2);
L2=pointCloud(mL2);
mL3 = cat(3,x3,y3,z3);
L3=pointCloud(mL3);
mL4 = cat(3,x4,y4,z4);
L4=pointCloud(mL4);
mL5 = cat(3,x5,y5,z5);
L5=pointCloud(mL5);
mL6 = cat(3,x6,y6,z6);
L6=pointCloud(mL6);

%Downsampling for easier regesteration

L1 = pcdownsample(L1,'random',.1);
L2 = pcdownsample(L2,'random',.1);
L3= pcdownsample(L3,'random',.1);
L4 = pcdownsample(L4,'random',.1);
L5 = pcdownsample(L5,'random',.1);
L6 = pcdownsample(L6,'random',.1);

%Patient section
%Seperating the lumbar vertebrae and finding the boundaries
mas=im2double(Mask2);
r=size(Mask2);
r=[6 r];
p2=zeros(r);
for t=1:6
    o=max(mas,[],'all');
    for i=1:length(mas(:,1,1))
        for j=1:length(mas(1,:,1))
            for k=1:length(mas(1,1,:))
                if mas(i,j,k) == o
                    p2(t,i,j,k)=1;
                    mas(i,j,k)=0;
                end
            end
        end
    end
    B=zeros(size(Mask2));
    B(:,:,:) = bwperim(p2(t,:,:,:));
    B=double(B);
    B=bwperim(B);
    B=double(B);
    p2(t,:,:,:)=B;
end

%finding each lumbar vertebra boundaries point cloud
q=1;
for i=1:length(p2(1,:,1,1))
    for j=1:length(p2(1,1,:,1))
        for k=1:length(p2(1,1,1,:))
            if p2(1,i,j,k)==1
                x1(q)=i;
                y1(q)=j;
                z1(q)=k;
                q=q+1;
            end
        end
    end
end
q=1;
for i=1:length(p2(2,:,1,1))
    for j=1:length(p2(2,1,:,1))
        for k=1:length(p2(2,1,1,:))
            if p2(2,i,j,k)==1
                x2(q)=i;
                y2(q)=j;
                z2(q)=k;
                q=q+1;
            end
        end
    end
end
q=1;
for i=1:length(p2(3,:,1,1))
    for j=1:length(p2(3,1,:,1))
        for k=1:length(p2(3,1,1,:))
            if p2(3,i,j,k)==1
                x3(q)=i;
                y3(q)=j;
                z3(q)=k;
                q=q+1;
            end
        end
    end
end
q=1;
for i=1:length(p2(4,:,1,1))
    for j=1:length(p2(4,1,:,1))
        for k=1:length(p2(4,1,1,:))
            if p2(4,i,j,k)==1
                x4(q)=i;
                y4(q)=j;
                z4(q)=k;
                q=q+1;
            end
        end
    end
end
q=1;
for i=1:length(p2(5,:,1,1))
    for j=1:length(p2(5,1,:,1))
        for k=1:length(p2(5,1,1,:))
            if p2(5,i,j,k)==1
                x5(q)=i;
                y5(q)=j;
                z5(q)=k;
                q=q+1;
            end
        end
    end
end
q=1;
for i=1:length(p2(6,:,1,1))
    for j=1:length(p2(6,1,:,1))
        for k=1:length(p2(6,1,1,:))
            if p2(6,i,j,k)==1
                x6(q)=i;
                y6(q)=j;
                z6(q)=k;
                q=q+1;
            end
        end
    end
end

%creating the point cloud
mL1 = cat(3,x1,y1,z1);
pL1=pointCloud(mL1);
mL2 = cat(3,x2,y2,z2);
pL2=pointCloud(mL2);
mL3 = cat(3,x3,y3,z3);
pL3=pointCloud(mL3);
mL4 = cat(3,x4,y4,z4);
pL4=pointCloud(mL4);
mL5 = cat(3,x5,y5,z5);
pL5=pointCloud(mL5);
mL6 = cat(3,x6,y6,z6);
pL6=pointCloud(mL6);

%Downsampling for easier regesteration
pL1 = pcdownsample(pL1,'random',.1);
pL2 = pcdownsample(pL2,'random',.1);
pL3 = pcdownsample(pL3,'random',.1);
pL4 = pcdownsample(pL4,'random',.1);
pL5 = pcdownsample(pL5,'random',.1);
pL6 = pcdownsample(pL6,'random',.1);

%Applying registeration
tform1 = pcregistercpd(pL1,L1);
tform2 = pcregistercpd(pL2,L2);
tform3 = pcregistercpd(pL3,L3);
tform4 = pcregistercpd(pL4,L4);
tform5 = pcregistercpd(pL5,L5);
tform6 = pcregistercpd(pL6,L6);




%Interpolation Section
mas=im2double(Mask2);
r=size(Mask2);
r=[6 r];
p2=zeros(r);
for t=1:6
    o=max(mas,[],'all');
    for i=1:length(mas(:,1,1))
        for j=1:length(mas(1,:,1))
            for k=1:length(mas(1,1,:))
                if mas(i,j,k) == o
                    p2(t,i,j,k)=1;
                    mas(i,j,k)=0;
                end
            end
        end
    end
end

q=1;
for i=1:length(p2(1,:,1,1))
    for j=1:length(p2(1,1,:,1))
        for k=1:length(p2(1,1,1,:))
            if p2(1,i,j,k)==1
                x1(q)=i;
                y1(q)=j;
                z1(q)=k;
                q=q+1;
            end
        end
    end
end
%Interpolating First lumbar vertebra
x7=linspace(min(tform1(:,1),[],'all'),max(tform1(:,1),[],'all'),q-1);
y7=linspace(min(tform1(:,2),[],'all'),max(tform1(:,2),[],'all'),q-1);
points1 = cat(3,x1,y1,z1);
ptcloud1 = pointCloud(points1);
F = scatteredInterpolant(tform1(:,1),tform1(:,2),tform1(:,3));
z7=F(x7,y7);
tform11=zeros(1,q-1,3);
tform11(1,:,:)=[x7;y7;z7]';
movingReg1 = pctransform(ptcloud1,tform11);




q=1;
for i=1:length(p2(2,:,1,1))
    for j=1:length(p2(2,1,:,1))
        for k=1:length(p2(2,1,1,:))
            if p2(2,i,j,k)==1
                x2(q)=i;
                y2(q)=j;
                z2(q)=k;
                q=q+1;
            end
        end
    end
end

%Interpolating Second lumbar vertebra
x7=linspace(min(tform2(:,1),[],'all'),max(tform2(:,1),[],'all'),q-1);
y7=linspace(min(tform2(:,2),[],'all'),max(tform2(:,2),[],'all'),q-1);
points2 = cat(3,x2,y2,z2);
ptcloud2 = pointCloud(points2);
F = scatteredInterpolant(tform2(:,1),tform2(:,2),tform2(:,3));
z7=F(x7,y7);
tform11=zeros(1,q-1,3);
tform11(1,:,:)=[x7;y7;z7]';
movingReg2 = pctransform(ptcloud2,tform11);



q=1;
for i=1:length(p2(3,:,1,1))
    for j=1:length(p2(3,1,:,1))
        for k=1:length(p2(3,1,1,:))
            if p2(3,i,j,k)==1
                x3(q)=i;
                y3(q)=j;
                z3(q)=k;
                q=q+1;
            end
        end
    end
end

%Interpolating 3rd lumbar vertebra
x7=linspace(min(tform3(:,1),[],'all'),max(tform3(:,1),[],'all'),q-1);
y7=linspace(min(tform3(:,2),[],'all'),max(tform3(:,2),[],'all'),q-1);
points3 = cat(3,x3,y3,z3);
ptcloud3 = pointCloud(points3);
F = scatteredInterpolant(tform3(:,1),tform3(:,2),tform3(:,3));
z7=F(x7,y7);
tform11=zeros(1,q-1,3);
tform11(1,:,:)=[x7;y7;z7]';
movingReg3 = pctransform(ptcloud3,tform11);



q=1;
for i=1:length(p2(4,:,1,1))
    for j=1:length(p2(4,1,:,1))
        for k=1:length(p2(4,1,1,:))
            if p2(4,i,j,k)==1
                x4(q)=i;
                y4(q)=j;
                z4(q)=k;
                q=q+1;
            end
        end
    end
end

%Interpolating 4th lumbar vertebra
x7=linspace(min(tform4(:,1),[],'all'),max(tform4(:,1),[],'all'),q-1);
y7=linspace(min(tform4(:,2),[],'all'),max(tform4(:,2),[],'all'),q-1);
points4 = cat(3,x4,y4,z4);
ptcloud4 = pointCloud(points4);
F = scatteredInterpolant(tform4(:,1),tform4(:,2),tform4(:,3));
z7=F(x7,y7);
tform11=zeros(1,q-1,3);
tform11(1,:,:)=[x7;y7;z7]';
movingReg4 = pctransform(ptcloud4,tform11);


q=1;
for i=1:length(p2(5,:,1,1))
    for j=1:length(p2(5,1,:,1))
        for k=1:length(p2(5,1,1,:))
            if p2(5,i,j,k)==1
                x5(q)=i;
                y5(q)=j;
                z5(q)=k;
                q=q+1;
            end
        end
    end
end

%Interpolating 5th lumbar vertebra
x7=linspace(min(tform5(:,1),[],'all'),max(tform5(:,1),[],'all'),q-1);
y7=linspace(min(tform5(:,2),[],'all'),max(tform5(:,2),[],'all'),q-1);
points5 = cat(3,x5,y5,z5);
ptcloud5 = pointCloud(points5);
F = scatteredInterpolant(tform5(:,1),tform5(:,2),tform5(:,3));
z7=F(x7,y7);
tform11=zeros(1,q-1,3);
tform11(1,:,:)=[x7;y7;z7]';
movingReg5 = pctransform(ptcloud5,tform11);


q=1;
for i=1:length(p2(6,:,1,1))
    for j=1:length(p2(6,1,:,1))
        for k=1:length(p2(6,1,1,:))
            if p2(6,i,j,k)==1
                x6(q)=i;
                y6(q)=j;
                z6(q)=k;
                q=q+1;
            end
        end
    end
end

%Interpolating 6th lumbar vertebra
x7=linspace(min(tform6(:,1),[],'all'),max(tform6(:,1),[],'all'),q-1);
y7=linspace(min(tform6(:,2),[],'all'),max(tform6(:,2),[],'all'),q-1);
points6 = cat(3,x6,y6,z6);
ptcloud6 = pointCloud(points6);
F = scatteredInterpolant(tform6(:,1),tform6(:,2),tform6(:,3));
z7=F(x7,y7);
tform11=zeros(1,q-1,3);
tform11(1,:,:)=[x7;y7;z7]';
movingReg6 = pctransform(ptcloud6,tform11);


%Concatenating the lumbar vertebrae
ptCloudOut1 = pcmerge(movingReg1, movingReg2, 1);
ptCloudOut2 = pcmerge(ptCloudOut1, movingReg3, 1);
ptCloudOut3 = pcmerge(movingReg4, ptCloudOut2, 1);
ptCloudOut4 = pcmerge(ptCloudOut3, movingReg5, 1);
ptCloudOut5 = pcmerge(ptCloudOut4, movingReg6, 1);


for i=1:length(Mask1(:,1,1))
    for j=1:length(Mask1(1,:,1))
        for k=1:length(Mask1(1,1,:))
            if Mask1(i,j,k) ~= 0
                x8(q)=i;
                y8(q)=j;
                z8(q)=k;
                q=q+1;
            end
        end
    end
end
points8=cat(3,x8,y8,z8);
ptcloud8=pointCloud(points8);

figure;
pcshow(ptCloudOut5);
figure;
pcshow(ptcloud8);