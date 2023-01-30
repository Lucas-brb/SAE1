function [test,I] = Calcul_Intersection_Triangle_Segment(A, B, C, O, G)
%Fonction de calcul d'intersection entre le triangle ABC et le segement OG
%version 1.2 par Gabriel HUREL  le 04/11/2019
%
%  [test,I] = Calcul_Intersection_Triangle_Droite(A, B, C, O, G) pour A, B,
%  C, O et G des points de l'espace (vecteurs 1 x 3)
%  S'il y a intersection entre le triangle et le segment, renvoie test=1,
%  sinon test=0.
%  I=[x y z] correspond aux coordonnées de l'intersection entre la droite OG
%  et le plan généré par le triangle ABC
%
%  Principe : On ecrit l'équation du plan : ax+by+cz+d=0
%  Et l'équation paramétrique du segment :
%  x=xO+dirx*t
%  y=yO+diry*t
%  z=zO+dirz*t
%  avec  t=[0,1]
%  Ecriture marticielle du système M xyzt = Y
%  M=[a b c   0  ;
%     1 0 0 -dirx;
%     0 1 0 -diry;
%     0 0 1 -dirz]
%  xyzt=[xI; yI, zI; tI]
%  Y=[-d; xO; yO; zO]

% equation du plan ax+by+cz+d=0
N=cross(C-A,B-A);                   % N=[a b c]
N=N./sqrt(sum(N.^2));               % On norme la normale
d=-sum(A.*N);                       % On résout l'équation avec A pour trouver d
% equation paramétrique du segment :
dir=G-O;
% Ecriture matricielle
M=[N 0;
    eye(3) -dir'];
Y=[-d;O'];
if abs(det(M))>eps                  % Peut-on résoudre le système ?
    xyzt=M\Y;                       % si oui : résolution du système
    I=xyzt(1:3)';                   % Coordonnées de I
    t=xyzt(4);                      % Valeur du paramètre t
    if t<0 || t>1                   % Le paramètre est-il en dehors [0, 1] ?
        test=0;                     % Si oui pas d'intersection
    else                            % Sinon, cette intersection est-elle dans le trianlge ?
        Ni=zeros(3,3);
        Ni(1,:)=cross(C-A,I-A);          % On calcule les vecteurs normaux des différents triangles
        Ni(2,:)=cross(B-C,I-C);
        Ni(3,:)=+cross(A-B,I-B);
        ni=0;
        for i=1:3
            if max(abs(Ni(i,:)))>0
                Ni(i,:)=Ni(i,:)./sqrt(sum(Ni(i,:).^2));    % On norme
                ni=ni+1;
            end
        end
        deter=sum(Ni)-ni*N;         % On regarde si ces triangles sont tous orientés dans le même sens
        if  sum(deter.^2)>eps       % Doit être égal à zéro pour que I soit dans le triangle
            test=0;
        else
            test=1;
        end
    end
else                                % sinon : pas d'intersection (dans le cas ou le segment
    % passerait par le triangle en étant tangeant à celui-ci,
    % on peut considérer qu'aucune ombre n'est créée).
    I=[];
    test=0;
end