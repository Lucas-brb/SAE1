%% Construction des variables de départ
Sommets_part_dieu = importdata('Sommets_part_dieu.mat');
Triangles_part_dieu = importdata("Triangles_part_dieu.mat");
[l,~] = size(Triangles_part_dieu);
Triangles_part_dieu = [Triangles_part_dieu 6*ones(l,1)];
[Sommets_bat,Triangles_bat] = Batiment();
Sommets_bat = Rotation(Sommets_bat,-0.1761,[5 75 0]);
[Sommets_ombres,Triangles_ombres] = Concatenation(Triangles_part_dieu,Sommets_part_dieu,Triangles_bat,Sommets_bat); %Ces variables seront utilisées dans la suit pour calculer l'intersection avec un triangle, ce qui réduit le temps de calcul
[Triangles_part_dieu,Sommets_part_dieu] = Tesselation(Triangles_part_dieu,Sommets_part_dieu,40);
[Triangles_bat,Sommets_bat] = Tesselation(Triangles_bat,Sommets_bat,10);
[Sommets1,Triangles1] = Concatenation(Triangles_part_dieu,Sommets_part_dieu,Triangles_bat,Sommets_bat);
Sommets_sol = [
    -350 -350 0
    350 -350 0
    350 350 0
    -350 350 0];
Triangles_sol = [
    1 2 3 10
    1 3 4 10];
[Triangles_sol,Sommets_sol] = Tesselation(Triangles_sol,Sommets_sol,1);
[Sommets,Triangles] = Concatenation(Triangles1,Sommets1,Triangles_sol,Sommets_sol);
[Source,~,~] = Calcul_position_soleil([10 01 2023], [10 00], [45 45 37.4 ; 4 51 51.3]); % heure prise au hasard, c'est l'affichage qui nous intéresse
Source = Source/1E5; %On divise par 1E5 pour que les ombres soient bien faites, sinon on a un problème
l = size(Triangles,1);
Couleurs = zeros(l,3); %initialisation des couleurs pour chaque triangle
tic
%% Calcul des ombres
for i = 1:l
    if Test_triangle_tourne_vers_source(Sommets(Triangles(i,1),:),Sommets(Triangles(i,2),:),Sommets(Triangles(i,3),:),Source)
        c = centre_gravite(Sommets(Triangles(i,1),:),Sommets(Triangles(i,2),:),Sommets(Triangles(i,3),:));
        if Test_intersection_Segment_Objet(c,Source,Triangles_ombres,Sommets_ombres)
            clr = 0.1; %un facteur de couleur plutôt noir
        else
            clr = Calcul_couleur_triangle(Sommets(Triangles(i,1),:),Sommets(Triangles(i,2),:),Sommets(Triangles(i,3),:), Source);
        end
    else
        clr = 0.1;
    end
    if Triangles(i,4) == 6
        Couleurs(i,:) = [225 198 153]/255*clr; % donne un triangle de couleur ocre
        patch('Faces',Triangles(i,1:3),'Vertices',Sommets,'FaceColor',Couleurs(i,:),'EdgeColor','none')
        hold on
    elseif Triangles(i,4) == 10
        Couleurs(i,:) = [clr clr clr]; % couleur grise
        patch('Faces',Triangles(i,1:3),'Vertices',Sommets,'FaceColor',Couleurs(i,:),'EdgeColor','none')
        hold on
    else
        Couleurs(i,:) = [0.574*clr 0.8766*clr clr]; % couleur bleue
        patch('Faces',Triangles(i,1:3),'Vertices',Sommets,'FaceColor',Couleurs(i,:),'EdgeColor','none')
        hold on
    end
    disp(i)
end
toc
%% Afiichage paramétré et sauvegarde
view(-47,63)
saveas(gcf,'Tesselation_1m2.png')