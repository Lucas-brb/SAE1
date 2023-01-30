load("Irr_d.mat")
load("Irr_g_d_22_01_20.mat")
Sommets = [0 0 0
    1 0 0
    1 1 0
    0 1 0
    0 0 1
    1 0 1
    1 1 1
    0 1 1];
Triangles = [1 3 2 0
    1 4 3 0
    1 2 6 2
    1 6 5 2
    2 7 6 3
    2 3 7 3
    3 8 7 1
    3 4 8 1
    4 5 8 4
    4 1 5 4
    5 6 7 5
    5 7 8 5];
%Triangles = [Triangles ; Triangles(:,1:3) + 8*ones(12,3) , Triangles(:,4)];
%[Triangles,Sommets] = Tesselation(Triangles,Sommets,10^(0));

Sommets_sol = [ -1 -1 0
    15 -1 0
    15 2 0
    -1 2 0];
Triangles_sol = [1 2 3 0
    1 3 4 0];

%[Triangles_sol,Sommets_sol] = Tesselation(Triangles_sol,Sommets_sol,10^(0));
[lts,~] = size(Triangles_sol);
Triangles = [Triangles;
    Triangles_sol(:,1:3) + length(Sommets)*ones(lts,3), Triangles_sol(:,4)];
Sommets = [Sommets
    Sommets_sol];
%Triangles_representatifs = [find(Triangles(:,4)==1,1)
%   find(Triangles(:,4)==2,1)
%  find(Triangles(:,4)==3,1)
% find(Triangles(:,4)==4,1)];
Irr_g_dir_moy = zeros(24,4);
for h = 0:23
    Irr_g_dir = zeros(60,4);
    for m = 0:59
        Irr_g_dir1 = [];
        Irr_g_dir2 = [];
        Irr_g_dir3 = [];
        Irr_g_dir4 = [];
        [Source,~,~] = Calcul_position_soleil([22 01 2020], [h-1 m], [45 45 37.4 ; 4 51 51.3]);
        C = coeff_calibrage(Triangles_sol,Sommets_sol,[h m+1],Source,Irr_d);
        [l,~] = size(Triangles);
        Couleurs = zeros(l,3);
        Irr_triangles = zeros(l,1);
        for i = 1:l
            if Test_triangle_tourne_vers_source(Sommets(Triangles(i,1),:),Sommets(Triangles(i,2),:),Sommets(Triangles(i,3),:),Source)
                c = centre_gravite(Sommets(Triangles(i,1),:),Sommets(Triangles(i,2),:),Sommets(Triangles(i,3),:));
                if Test_intersection_Segment_Objet(c,Source,Triangles,Sommets,i)
                    Couleurs(i,:) = [0.05 0.05 0.05];
                else
                    Couleurs(i,:) = Calcul_couleur_triangle(Sommets(Triangles(i,1),:),Sommets(Triangles(i,2),:),Sommets(Triangles(i,3),:), Source);
                    Irr_triangles(i) = C*dot(normale(Sommets(Triangles(i,1),:),Sommets(Triangles(i,2),:),Sommets(Triangles(i,3),:)),Source-c)/norme(c-Source);
                end
            else
                Couleurs(i,:) = [0.05 0.05 0.05];
            end
            %patch('Faces',Triangles(i,1:3),'Vertices',Sommets,'FaceColor',Couleurs(i,:))
            %hold on
            %disp(i)
        end
        Irr_g = Irr_triangles + Irr_g_d_22_01_20(h*60+m+1,2)*ones(l,1);
        for i = 1:l
            f = Triangles(i,4);
            if f == 1
                Irr_g_dir1 = [Irr_g_dir1 ; Irr_g(i)];
            elseif f == 2
                Irr_g_dir2= [Irr_g_dir2 ; Irr_g(i)];
            elseif f == 3
                Irr_g_dir3 = [Irr_g_dir3 ; Irr_g(i)];
            elseif f == 4
                Irr_g_dir4 = [Irr_g_dir4 ; Irr_g(i)];
            end
        end
        Irr_g_dir(m+1,1) = mean(Irr_g_dir1);
        Irr_g_dir(m+1,2) = mean(Irr_g_dir2);
        Irr_g_dir(m+1,3) = mean(Irr_g_dir3);
        Irr_g_dir(m+1,4) = mean(Irr_g_dir4);
        %plot3(Source(1),Source(2),Source(3),'o')
        %patch('Faces',Triangles,'Vertices',Sommets,'FaceColor',Couleurs)
    end
    Irr_g_dir_moy(h+1,:) = mean(Irr_g_dir);
    disp(h)
end
