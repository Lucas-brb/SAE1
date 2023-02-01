%% Construction de la scène
load('Sommets_part_dieu.mat')
load("Triangles_part_dieu.mat")
Sommets_part_dieu = Sommets;
[l,~] = size(Triangles);
Triangles_part_dieu = [Triangles 6*ones(l,1)]; %load donne le nom Sommets et Triangles, on leur donne un nom plus explicite
[Sommets_bat,Triangles_bat] = Batiment();
[Triangles_bat,Sommets_bat] = Tesselation(Triangles_bat,Sommets_bat,160);
[Sommets1,Triangles1] = Concatenation(Triangles_part_dieu,Sommets_part_dieu,Triangles_bat,Sommets_bat);
Sommets_sol = [
    -350 -350 0
    350 -350 0
    350 350 0
    -350 350 0];
Triangles_sol = [
    1 2 3 10
    1 3 4 10];
[Triangles_sol,Sommets_sol] = Tesselation(Triangles_sol,Sommets_sol,1600);
[Sommets,Triangles] = Concatenation(Triangles1,Sommets1,Triangles_sol,Sommets_sol);
[Source,~,~] = Calcul_position_soleil([10 01 2023], [10 00], [45 45 37.4 ; 4 51 51.3]);
Source = Source/1E3;
%Source = [-400 -400 100];
[l,~] = size(Triangles);
Couleurs = zeros(l,3);
tic
for i = 1:l
    if Triangles(i,4) ~= 6
        if Test_triangle_tourne_vers_source(Sommets(Triangles(i,1),:),Sommets(Triangles(i,2),:),Sommets(Triangles(i,3),:),Source)
            c = centre_gravite(Sommets(Triangles(i,1),:),Sommets(Triangles(i,2),:),Sommets(Triangles(i,3),:));
            if Test_intersection_Segment_Objet(c,Source,Triangles,Sommets,Triangles1)
                Couleurs(i,:) = [0.05 0.05 0.05];
            else
                Couleurs(i,:) = Calcul_couleur_triangle(Sommets(Triangles(i,1),:),Sommets(Triangles(i,2),:),Sommets(Triangles(i,3),:), Source);
            end
        else
            Couleurs(i,:) = [0.05 0.05 0.05];
        end
    else
        Couleurs(i,:) = [1 0 0];
    end
    if Triangles(i,4) == 10
        patch('Faces',Triangles(i,1:3),'Vertices',Sommets,'FaceColor',Couleurs(i,:),'EdgeColor','none')
        hold on
    else
        patch('Faces',Triangles(i,1:3),'Vertices',Sommets,'FaceColor',Couleurs(i,:))
        hold on
    end
    disp(i)
end
toc