function [Pop_triee] = Tri_pop(Population)
% [Pop_triee] = Tri_pop(Population)
% On effectue un tri de la liste Population en fonction de la consommation
% énergétique du bâtiment
l = size(Population,1);
Conso_energetique = zeros(l,1);
for i = 1:l
    Conso_energetique(l) = Calcul_conso(Population(i,:));
end
[~,I] = sort(Conso_energetique); % le I donne les indices initiaux des éléments triés, afin de retrouver à quel batiment correspond quelle consommation
Pop_triee = zeros(l,5);
for i = 1:l
    Pop_triee(i) = Population(I(i));
end
Pop_triee = Pop_triee(1:l/2,:); % On garde la moitié supérieure