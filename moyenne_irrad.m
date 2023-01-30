function [irrad_moy] = moyenne_irrad(I)
%[irrad_moy] = moyenne_irrad(I)
%   faire une liste de la moyenne par heure de l'irradiance à partir d'une
%   par minute
irrad_moy= zeros(24,1)
for i=1:24
    Li=sum(I(60*(i-1)+1:60*i))/60
    irrad_moy(i)=Li
end

end