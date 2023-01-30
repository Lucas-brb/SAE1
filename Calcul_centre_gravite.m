function [G]=Calcul_centre_gravite(A,B,C)
%G centre de gravité 
% A,B,C trois sommets du triangle 
%Calcul_centre_gravite
% Alice, Charlotte, Océlia
% T1, C
% 10/10/2022
% V1.0

    for i=1:3
        G(i)=(A(i)+B(i)+C(i))/3 ;
    end 
end 


    