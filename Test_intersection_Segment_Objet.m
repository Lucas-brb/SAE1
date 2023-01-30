function [res]=Test_intersection_Segment_Objet (Centredegravite, Source, Triangles, Sommets, Triangles_ombre)
% Calcul_centre_gravite.m
% Bettache Izia, Bourel de la Ronciere Agathe, Thomas Maud 
% version 1.0 le 5/10/2022
% Test est un booléen qui vaut 1 s il existe une intersection 
% entre le segment [Centre_de_gravite Source] et l objet 3D défini par Triangles et Sommets.
% test= 0 si il n’y a pas d’intersection
res = 0;
%test pour tous les triangles de la figure
vect_unit_source = (Source - Centredegravite)/norme(Source-Centredegravite);
cg1 = Centredegravite + vect_unit_source;
for i=1:size(Triangles_ombre,1)
    if Triangles(i,4) ~= 10
        %recuperation des coordonnes des sommets de chaque triangle
        A=Sommets(Triangles_ombre(i,1),:);
        B=Sommets(Triangles_ombre(i,2),:);
        C=Sommets(Triangles_ombre(i,3),:);
        %utilisation de la fonction qui teste l'intersection avec un triangle
        [test,~] = Calcul_Intersection_Triangle_Segment(A, B, C, Source, cg1);
        if test==1
            res = 1;
            break
            %si on a trouvé une intersection avec un triangle de l'objet, la
            %boucle s'arrete
        end
    end
end