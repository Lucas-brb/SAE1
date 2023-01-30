% Test tesselation 1 triangle
Sommets = 10*rand(3,3);
Triangles = [1 2 3];
[Sommets(4:6,:),Triangles] = Tesselation_1_triangle(Sommets,Triangles,4);
%patch('Faces',Triangles,'Vertices',Sommets,'FaceColor',[0 1 1])

% Test tesselation globale
Sommets = 10*rand(4,3);
Triangles = [1 3 2 ; 1 2 4 ; 2 3 4 ; 1 4 3];
smax = 0.8;
[Triangles,Sommets] = Tesselation(Triangles,Sommets,smax);
patch('Faces',Triangles,'Vertices',Sommets,'FaceColor',[0 1 1])
hold on
for i = 1: size (Triangles,1)
    A= Sommets(Triangles(i,1),:);
    B= Sommets(Triangles(i,2),:);
    C= Sommets(Triangles(i,3),:);
    N=Calcul_normale_triangle(A,B,C);
    G=Calcul_centre_gravite(A,B,C);
    quiver3(G(1),G(2),G(3),N(1),N(2),N(3));
    hold on 
end
%plot3 (Source(1),Source(2),Source(3),'x');
hold on