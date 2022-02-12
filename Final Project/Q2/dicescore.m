function DSC = dicescore(A,B)
%Computing the Dise score between two poin clouds
%Dice score=2*(number of intersection of two sets)/(number of elemnts in set1 + number of elemnts in set2)
%When you merge two point clouds with gridstep=1,It's like getting union
%from the sets
u=pcmerge(A,B,1);
r1=size(u.Location);
r2=size(A.Location);
r3=size(B.Location);
r1=max(r1);
r2=max(r2);
r3=max(r3);
DSC=2*(r2+r3-r1)/(r2+r3);
end

