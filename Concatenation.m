function [Tous_les_sommets,Tous_les_triangles] = Concatenation(T1,S1,T2,S2)
%[Tous_les_sommets,Tous_les_triangles] = Concatenation(T1,S1,T2,S2)
%   
T1s = T1(:,1:3);
T2s = T2(:,1:3);
Tous_les_sommets=[S1;S2];
Tous_les_triangles=[T1s T1(:,4)
    T2s + size(S1,1) T2(:,4)];
end