function [C] = Calcul_couleur_triangle(A,B,C,Source)
%calcul la couleur d'un triangle en fonction de sa position a la source 
%   Detailed explanation 
K = 0.1;
G = centre_gravite(A,B,C);
if Test_triangle_tourne_vers_source(A,B,C,Source)
    c = K + (-dot(normale(A,B,C), G - Source)*0.8)/norme(G-Source); %/norme(G-Source)^2;
else
    c = K;
end
C = [c c c];
end