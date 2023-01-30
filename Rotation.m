Sommets=[
%Objet parallélépipède
0,0,0;
10,0,0;
10,10,0;
10,0,10;
0,10,0;
0,10,10;
0,0,10;
10,10,10];
Triangles=[
%Objet parallélépipède
1,2,3;
1,3,5;
1,4,2;
1,7,4;
1,5,6;
1,6,7;
2,8,3;
2,4,8;
5,3,8;
5,8,6;
7,8,4;
7,6,8];
Sommets = Sommets*[cos(pi/3) -sin(pi/3) 0
    sin(pi/3) cos(pi/3) 0
    0 0 1];
patch('Faces',Triangles,'Vertices',Sommets);