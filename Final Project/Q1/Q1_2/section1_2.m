%%
clc
clear
%it can be used for all other patients

% converting the mask into double and find where it's not zero gies us the
% points so we can create the point cloud
Mask1 = niftiread('00_mask.nii');
Mask2 = niftiread('pat2_label.nii');
Mask3 = niftiread('pat8_label.nii');
q=1;
for i=1:length(Mask1(:,1,1))
    for j=1:length(Mask1(1,:,1))
        for k=1:length(Mask1(1,1,:))
            if Mask1(i,j,k) ~= 0
                x(q)=i;
                y(q)=j;
                z(q)=k;
                q=q+1;
            end
        end
    end
end
q=1;
for i=1:length(Mask2(:,1,1))
    for j=1:length(Mask2(1,:,1))
        for k=1:length(Mask2(1,1,:))
            if Mask2(i,j,k) ~= 0
                x1(q)=i;
                y1(q)=j;
                z1(q)=k;
                q=q+1;
            end
        end
    end
end
q=1;
for i=1:length(Mask3(:,1,1))
    for j=1:length(Mask3(1,:,1))
        for k=1:length(Mask3(1,1,:))
            if Mask3(i,j,k) ~= 0
                x2(q)=i;
                y2(q)=j;
                z2(q)=k;
                q=q+1;
            end
        end
    end
end
points = cat(3,x,y,z);
ptcloud=pointCloud(points);
points1 = cat(3,x1,y1,z1);
ptcloud1=pointCloud(points1);
points2 = cat(3,x2,y2,z2);
ptcloud2=pointCloud(points2);
figure;
pcshow(ptcloud);
figure;
pcshow(ptcloud1);
figure;
pcshow(ptcloud2);
