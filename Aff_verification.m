function []=Aff_verification(Sommets, Triangles, Source)
%Dessine la source, l'objet 3D (Sommets, Triangles) ainsi que les normales
%à chaque triangles de l'objet 3D
% Aff_verification
% Alice, Charlotte, Océlia
% T1, C
% 10/10/2022
% V1.0
patch('Faces',Triangles,'Vertices', Sommets,'FaceColor', [0.3 0.3 0.3]) ;
hold on 
for i = 1: size (Triangles,1)
    A= Sommets(Triangles(i,1),:);
    B= Sommets(Triangles(i,2),:);
    C= Sommets(Triangles(i,3),:);
    N=normale(A,B,C);
    G=centre_gravite(A,B,C);
    quiver3(G(1),G(2),G(3),N(1),N(2),N(3));
    hold on 
end
plot3 (Source(1),Source(2),Source(3),'x');
hold on
end 

