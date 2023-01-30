function [Triangles,Sommets] = Tesselation(Triangles,Sommets,S_max)
S = surface_triangle_maxi_obj(Sommets,Triangles);
while S > S_max
    [l,~] = size(Triangles);
    [ls,~] = size(Sommets);
    Triangles1 = zeros(4*l,4); % on crée la liste avec la bonne taille pour un gain de temps
    Sommets1 = zeros(ls + 3*l,3); % idem
    Sommets1(1:ls,:) = Sommets; 
    for j = 1:l
        [L1,T1] = Tesselation_1_triangle(Sommets,Triangles(j,:),ls+3*(j-1)+1);
        Triangles1(4*(j-1)+1:4*j,:) = T1;
        Sommets1(ls+3*(j-1)+1:ls+3*j,:) = L1;
    end
    Triangles = Triangles1;
    Sommets = Sommets1;
    S = S/4;
end

%patch('Faces',Triangles,'Vertices',Sommets,'FaceColor',[0 1 1])

end