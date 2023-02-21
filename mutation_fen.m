function [Population_nv] = mutation_fen(Population_ancienne)
%[Population_nv] = mutation(Population_ancienne)
%  à chaque génération, il y a au plus 1% d'individus qui muteront
%   mutation= 1 paramètre au hasard change de facon aléatoire
% n au minimum 5

n=length(Population_ancienne);
Population_nv=Population_ancienne;
nbr_mutation=randi(0.1*n);

num_des_mutants=randi(n,nbr_mutation,1);
%liste des numéros des ind qui seront mutés

for i=1:nbr_mutation
    num=num_des_mutants(i);
    parametre_mute=randi(4);
    Population_nv(num,parametre_mute)=10+rand()*80;
end
end