function [Smax] = surface_triangle_maxi_obj(L,T)
%function [Smax] = surface_triangle_maxi_obj(L,T)
%   Calcule la surface max parmis tt les triangles de l'objet en prenant en
%      entrées les matrices Sommets L et Triangles T
[nbrTriangles,c]=size(T);
Smax=0;
for i=1:nbrTriangles
    triangle=T(i,:);
    j1=triangle(1);
    j2=triangle(2);
    j3=triangle(3);
    LL=[L(j1,:); L(j2,:) ;L(j3,:)];
    s=surface_1_triangle(LL);
    if s>Smax
        Smax=s;
    end


end