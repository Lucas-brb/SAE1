function [S] = surface_1_triangle(L)
%function [S] = surface_1_triangle(L)
%   Calcule la surface de 1 triangle
%     Avec L matrice(3x3) de 3 sommets
u=[L(2,1)-L(1,1) L(2,2)-L(1,2) L(2,3)-L(1,3)];
v=[L(3,1)-L(2,1) L(3,2)-L(2,2) L(3,3)-L(2,3)];
U=cross(u,v);
S=0.5*(U(1)^2 + U(2)^2 + U(3)^2)^0.5;

end