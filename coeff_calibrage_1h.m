function [calibrage]= coeff_calibrage_1h(Triangles,Sommets,heure,Source,irradiance_directe)

min=heure(1) + heure(2);

[l,~]=size(Triangles);
for i=1:l
    if Triangles(i,4)==0
        T=Triangles(i,:);
        break
    end
end
A = Sommets(T(1),:);
B = Sommets(T(2),:);
C = Sommets(T(3),:);
c = dot(normale(A,B,C),Source-centre_gravite(A,B,C))/norme(Source-centre_gravite(A,B,C));

if irradiance_directe(min)==0 || Source(3) <= 0
    calibrage = 0;
else
    calibrage=abs(irradiance_directe(min)/c);
end



