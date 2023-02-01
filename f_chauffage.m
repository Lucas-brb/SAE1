function [Chauffage_22Janvier]=f_chauffage(Individu,Irr)
% implantation modele excel sur matlab
%   Donne le chauffage nécessaire à une configuration le 22 janvier 2020
%       selon l'irradiance


B3=0.13;
C3=0.04;
B4=0.1;
B5=0.17;
C4=C3;
C5=C3;

%%longueur bat et ratio fenetre a def
%   F3=LongEst     F4=LongSud     F5=Hauteur        F6=nbr niveaux
%   I3=FenetreSud  I4=FenetreEst  I5=Fenetre Ouest  I6=FenetreNord



B10=0.03;
B11=1.5     ;
B12=0.4;
B13=1.25;
B14=1.5;
D10=2;

G9=1.1;
G10=0.34;
G11=0.5;
G12=19;
I9=0.5;
I10=4;
I11=2100;
I12=18;

C19=0.01;
C20=0.03;
D19=0.15;
D20=4.69;
E19=0.2;
E20=0.13;
F19=0.02;
F20=0.01;

C23=0.01;
C24=0.03;
D23=0.25;
D24=7.81;
E23=0.15;
E24=0.1;

C27=0.02;
C28=0.02;
D27=0.05;
D28=0.03;
E27=0.15;
E28=4.69;
F27=0.15;
F28=0.1;

B32=1/(C20+D20+E20+F20+B3+C3);
B33=1/(C24+D24+E24+C4+B4);
B34=1/(C28+D28+E28+F28+C5+B5);
B35=D10;


C33=4900;
%C33=Surf_Sol calcul a la main
C34=C33;

D32=1;
D33=1;
D34=0.5;
D35=1;

[C32,D39,D38,F39,F38]=Calcul_surf_mur_fenetre(Individu);
C35=D39+D38+F39+F38;

E32=B32*C32*D32;
E33=B33*C33*D33;
E34=B34*C34*D34;
E35=B35*C35*D35;

B38=1.1*(E32+E33+E34+E35);
B39=G10*G11*312000;
%volume a la main

I38=124800;
%Surface chauffee a la main

% Irr tableau 4 colonnes et 24 lignes

%   B43=Irr(1,1) B44=Irr(2,1) .... B66=Irr(24,1)
%   C43=Irr(1,2) ...
%   E43=Irr(1,4)

%Temperature= vecteur 24 elements tirés d'Excel
Temperature=[0.46 0.13 0.06 0.07 -0.78 -1.24 -1.63 -1.73 -1.83 -1.16 0.14 1.3 2.41 5.11 5.24 5.2 4.45 3.62 3.04 2.53 1.83 1.4 1.06 1];

Ql=zeros(1,24);
for i=1:24
    Ql(i)=(B38+B39)*(G12-Temperature(i))/1000;
end

Qs=zeros(1,24);
for i=1:24
    Qs(i)=(Irr(i,1)*D39+Irr(i,2)*D38+Irr(i,3)*F39+Irr(i,4)*F38)*I9/1000;
end

Qg=zeros(1,24);
for i=1:24
    Qg(i)=I10*I38/1000+Qs(i);
end

Qc=zeros(1,24);
for i=1:24
    Qc(i)=max(0, Ql(i)-Qg(i));
end

Chauffage_22Janvier=sum(Qc)

