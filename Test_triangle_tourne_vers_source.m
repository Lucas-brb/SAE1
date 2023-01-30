function [res] = Test_triangle_tourne_vers_source(A,B,C,Source)
%Détermine si un triangle est tourné vers la source ou si il ne l'est pas
%   compare la normale du triangle au vecteur allant de la source au centre
%   de gravité de ce dernier
N = normale(A,B,C);
R = Source - centre_gravite(A,B,C);
if dot(R,N)<0
    res = 0;
else
    res = 1;
end