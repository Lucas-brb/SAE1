function [Sommets,Triangles] = Batiment()
Sommets1=[
%Objet parallélépipède
-30,40,0;
40,40,0;
40,110,0;
40,40,30;
-30,110,0;
-30,110,30;
-30,40,30;
40,110,30];

Triangles1=[
%Objet parallélépipède
1,3,2,0
1,5,3,0
1,2,4,2
1,4,7,2
1,6,5,4
1,7,6,4
2,3,8,3
2,8,4,3
5,8,3,1
5,6,8,1
7,4,8,0
7,8,6,0];


Sommets2=[
%Objet parallélépipède
-20,50,30;
30,50,30;
30,100,30;
30,50,70;
-20,100,30;
-20,100,70;
-20,50,70;
30,100,70];


Sommets3=[
%Objet parallélépipède
-10,60,70;
20,60,70;
20,90,70;
20,60,120;
-10,90,70;
-10,90,120;
-10,60,120;
20,90,120];

Sommets4=[
%Objet parallélépipède
-5,65,120;
15,65,120;
15,85,120;
15,65,170;
-5,85,120;
-5,85,170;
-5,65,170;
15,85,170;
7.5,72.5,170;
7.5,77.5,170;
2.5,75,170;
5,75,215];

Triangles4=[
%Objet parallélépipède
1,3,2,0;
1,5,3,0;
1,2,4,2;
1,4,7,2;
1,6,5,4;
1,7,6,4;
2,3,8,3;
2,8,4,3;
5,8,3,1;
5,6,8,1;
7,4,8,0;
7,8,6,0;
%Tétraèdre
9,12,11,5;
9,11,10,5;
9,10,12,5;
11,12,10,5];

[Sommets,Triangles] = Concatenation(Triangles1,Sommets1,Triangles1,Sommets2);
[Sommets,Triangles] = Concatenation(Triangles,Sommets,Triangles1,Sommets3);
[Sommets,Triangles] = Concatenation(Triangles,Sommets,Triangles4,Sommets4);
end