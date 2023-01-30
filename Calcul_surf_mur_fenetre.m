function [Surf_mur,Surf_fenetre_N,Surf_fenetre_S,Surf_fenetre_E,Surf_fenetre_O] = Calcul_surf_mur_fenetre(Batiment_pop)
%[Surf_mur] = Calcul_surf_mur(Batiment_pop)
%   On calcule la surface des murs avec les caractéristiques du bâtiment
Surf_mur_N = 70*30*(1-Batiment_pop(1)) + 50*40*(1-Batiment_pop(1)) + 30*50*(1-Batiment_pop(1)) + 20*50*(1-Batiment_pop(1));
Surf_mur_S = 70*30*(1-Batiment_pop(2)) + 50*40*(1-Batiment_pop(2)) + 30*50*(1-Batiment_pop(2)) + 20*50*(1-Batiment_pop(2));
Surf_mur_E = 70*30*(1-Batiment_pop(3)) + 50*40*(1-Batiment_pop(3)) + 30*50*(1-Batiment_pop(3)) + 20*50*(1-Batiment_pop(3));
Surf_mur_O = 70*30*(1-Batiment_pop(4)) + 50*40*(1-Batiment_pop(4)) + 30*50*(1-Batiment_pop(4)) + 20*50*(1-Batiment_pop(4));
Surf_fenetre_N = 70*30*Batiment_pop(1) + 50*40*Batiment_pop(1) + 30*50*Batiment_pop(1) + 20*50*Batiment_pop(1);
Surf_fenetre_S = 70*30*Batiment_pop(2) + 50*40*Batiment_pop(2) + 30*50*Batiment_pop(2) + 20*50*Batiment_pop(2);
Surf_fenetre_E = 70*30*Batiment_pop(3) + 50*40*Batiment_pop(3) + 30*50*Batiment_pop(3) + 20*50*Batiment_pop(3);
Surf_fenetre_O = 70*30*Batiment_pop(4) + 50*40*Batiment_pop(4) + 30*50*Batiment_pop(4) + 20*50*Batiment_pop(4);
Surf_mur = Surf_mur_O + Surf_mur_E + Surf_mur_S + Surf_mur_N;
end