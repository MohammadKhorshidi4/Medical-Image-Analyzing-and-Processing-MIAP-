%%
clc
clear
%it can be used for all other patients

V1 = niftiread('00.nii');
V2 = niftiread('pat2.nii');
V3 = niftiread('pat8.nii');
Mask1 = niftiread('00_mask.nii');
Mask2 = niftiread('pat2_label.nii');
Mask3 = niftiread('pat8_label.nii');
%using imtool3D to show the volume
figure;
tool = imtool3D(V1);
tool.setMask(Mask1);
figure;
tool = imtool3D(V2);
tool.setMask(Mask2);
figure;
tool = imtool3D(V3);
tool.setMask(Mask3);