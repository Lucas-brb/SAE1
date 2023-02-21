function [Irr_g_dir_moy] = Calcul_Irrad(Sommets,Triangles)
Sommets_part_dieu = importdata('Sommets_part_dieu.mat');
Triangles_part_dieu = importdata("Triangles_part_dieu.mat");
l = size(Triangles_part_dieu,1);
Triangles_part_dieu = [Triangles_part_dieu 6*ones(l,1)];
Sommets_sol = [ -1 -1 0
    15 -1 0
    15 2 0
    -1 2 0];
Triangles_sol = [1 2 3 0
    1 3 4 0];
[Sommets_ombres,Triangles_ombres] = Concatenation(Triangles_part_dieu,Sommets_part_dieu,Triangles,Sommets);
[Triangles,Sommets] = Tesselation(Triangles,Sommets,160);
Irr_d = importdata("Irr_d.mat");
Irr_g_d_22_01_20 = importdata("Irr_g_d_22_01_20.mat");
Irr_g_dir_moy = zeros(24,4);
for h = 0:23
    Irr_g_dir = zeros(60,4);
    for m = 0:59
        Irr_g_dir1 = [];
        Irr_g_dir2 = [];
        Irr_g_dir3 = [];
        Irr_g_dir4 = [];
        [Source,~,~] = Calcul_position_soleil([22 01 2020], [h-1 m], [45 45 37.4 ; 4 51 51.3]);
        Source=Source/1000;
        C = coeff_calibrage(Triangles_sol,Sommets_sol,[h m+1],Source,Irr_d);
        [l,~] = size(Triangles);
        Irr_triangles = zeros(l,1);
        for i = 1:l
            if Test_triangle_tourne_vers_source(Sommets(Triangles(i,1),:),Sommets(Triangles(i,2),:),Sommets(Triangles(i,3),:),Source)
                c = centre_gravite(Sommets(Triangles(i,1),:),Sommets(Triangles(i,2),:),Sommets(Triangles(i,3),:));
                if ~Test_intersection_Segment_Objet(c,Source,Triangles_ombres,Sommets_ombres)
                    Irr_triangles(i) = C*dot(normale(Sommets(Triangles(i,1),:),Sommets(Triangles(i,2),:),Sommets(Triangles(i,3),:)),Source-c)/norme(c-Source);
                end
          
            end
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
    end
    Irr_g_dir_moy(h+1,:) = mean(Irr_g_dir);
end
end