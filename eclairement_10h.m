l = size(Triangles,1);
Irr_N = [];
Irr_S = [];
Irr_E = [];
Irr_O = [];
[Source,~,~] = Calcul_position_soleil([22 01 2020], [9 0], [45 45 37.4 ; 4 51 51.3]);
C = coeff_calibrage(Triangles_sol,Sommets_sol,[10 1],Source,Irr_d);
for i = 1:l
    if Triangles(i,4) == 1
        Irr_N = [Irr_N ; (Couleurs(i,3)-0.1)/0.8*C];
    elseif Triangles(i,4) == 2
        Irr_S = [Irr_S ; (Couleurs(i,3)-0.1)/0.8*C];
    elseif Triangles(i,4) == 3
        Irr_E = [Irr_E ; (Couleurs(i,3)-0.1)/0.8*C];
    elseif Triangles(i,4) == 4
        Irr_O = [Irr_O ; (Couleurs(i,3)-0.1)/0.8*C];
    end
end
Irr_moy_faces = [mean(Irr_N)
    mean(Irr_S)
    mean(Irr_E)
    mean(Irr_O)];