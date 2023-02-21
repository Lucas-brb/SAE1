function [Meilleure_config] = graphe_opti_fen(n,N)
%UNTITLED Summary of this function goes here
%   Population de taille 4n
%   Optimisation à N itérations (N "reproductions")
%   Graphe avec y=chauffage et x=numéro itération
%   Un point représente la meilleure configuration de l'itération
%   Deuxième graphe avec la variance des différents paramètres

Sommets_Bat=[-30	40	0;
40	40	0
40	110	0
40	40	30
-30	110	0
-30	110	30
-30	40	30
40	110	30
-20	50	30
30	50	30
30	100	30
30	50	70
-20	100	30
-20	100	70
-20	50	70
30	100	70
-10	60	70
20	60	70
20	90	70
20	60	120
-10	90	70
-10	90	120
-10	60	120
20	90	120
-5	65	120
15	65	120
15	85	120
15	65	170
-5	85	120
-5	85	170
-5	65	170
15	85	170
7.50000000000000	72.5000000000000	170
7.50000000000000	77.5000000000000	170
2.50000000000000	75	170
5	75	215];
Sommets_Bat = Rotation(Sommets_Bat,-0.1761,[5 75 0]);

Triangles_Bat=[1	3	2	0
1	5	3	0
1	2	4	2
1	4	7	2
1	6	5	4
1	7	6	4
2	3	8	3
2	8	4	3
5	8	3	1
5	6	8	1
7	4	8	0
7	8	6	0
9	11	10	8
9	13	11	8
9	10	12	10
9	12	15	10
9	14	13	12
9	15	14	12
10	11	16	11
10	16	12	11
13	16	11	9
13	14	16	9
15	12	16	8
15	16	14	8
17	19	18	16
17	21	19	16
17	18	20	18
17	20	23	18
17	22	21	20
17	23	22	20
18	19	24	19
18	24	20	19
21	24	19	17
21	22	24	17
23	20	24	16
23	24	22	16
25	27	26	24
25	29	27	24
25	26	28	26
25	28	31	26
25	30	29	28
25	31	30	28
26	27	32	27
26	32	28	27
29	32	27	25
29	30	32	25
31	28	32	24
31	32	30	24
33	35	36	29
33	34	35	29
33	36	34	29
35	34	36	29];


X=1:N;
CONSO_OPTI=zeros(1,N);
CONS=zeros(4*n,N);
% 1e colonne= les individus à la 1e itération
% 1e ligne= Un individu à toutes les itérations

VARIANCE=zeros(N,5);
Population=creation_population_fen(n);
Meilleure_config=[];
Irr = Calcul_Irrad(Sommets_Bat,Triangles_Bat);
for i=1:N
    Population=enfanter(Population);
    Population=mutation_fen(Population);    
    for j=1:size(Population,1)
        ConsoJ=f_chauffage(Population(j,:),Irr);
        CONS(j,i)=ConsoJ;
    end
    [Conso,I]=sort(CONS(:,i));
    Pop_triee=zeros(4*n,5);
    for j = 1:4*n
        Pop_triee(j,:) = Population(I(j),:);
    end
    Pop_triee = Pop_triee(1:2*n,:);
    CONSO_OPTI(i)=Conso(1);
    Meilleure_config = [Meilleure_config ; Pop_triee(1,:)];
    Population=Pop_triee;
    V=var(Population);
    VARIANCE(i,:)=V;
end
figure(1)
plot(X,CONSO_OPTI,'*')
title('Meilleure consommation par itération')
figure(2)
plot(X,VARIANCE(:,1),'r',X,VARIANCE(:,2),'g',X,VARIANCE(:,3),'b',X,VARIANCE(:,4),'m')
title('Variance des paramètres')
end
