%%ALGO pour optimisation génétique
%   Idée = Prendre x configurations 
%          faire des x/2 couples aléatoires
%          faire des enfants qui gardent certains paramètres et les autres enfants les autres
%          garder les x meilleurs enfants selon conso
%          faire des enfants aux x
%          faire n itérations


%% 5 paramètres à prendre en compte
% Pourcentage de vitre sur chacune des 4 faces du bat
% Angle que fait le batiment

% 1e=vitre nord  2e=vitre sud  3e=vitre est  4e=vitre ouest   5e=angle bat entre +/- pi/4

function [Population] = creation_population_fen(n)

Population=zeros(2*n,5);

for i=1:2*n
    carac=[10+rand([1,4]).*80 -0.1761];
    Population(i,:)=carac;
end


end




