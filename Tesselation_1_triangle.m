function [L1,T1] = Tesselation_1_triangle(L,T,k)
%Tesselation_1_triangle(L,T,k)
%   Effectue la tesselation d'un seul triangle
%   k est l'indice du premier point créé à partir de cette fonction dans la
%   liste de sommets
a = L(T(1),:);
b = L(T(2),:);
c = L(T(3),:);
a1 = (a+b)/2;
b1 = (b+c)/2;
c1 = (c+a)/2;
ia1 = k;
ib1 = k+1;
ic1 = k+2;
L1 = [a1 ; b1 ; c1];
T1 = [T(1) ia1 ic1 T(1,4);
    ia1 T(2) ib1 T(1,4);
    ic1 ib1 T(3) T(1,4);
    ia1 ib1 ic1 T(1,4)];
end