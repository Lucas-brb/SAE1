function [Enfants] = enfanter(Population)
%[Enfants] = enfanter(Population)
%   on prend 2 individus au hasard dans la population et ils font 2 enfants
%   chaque enfant prend une moitie différente des carac de chaque parent
%   on réitère n fois

n=length(Population);

Enfants=zeros(2*n,5);


for i=1:n
    num1=randi(n);
    num2=randi(2);
    while num1==num2
        num1=randi(n);
        num2=randi(n);
    end
    pere=Population(num1,:);
    mere=Population(num2,:);
    enfant1=zeros(1,5);
    enfant2=zeros(1,5);
    enfant1(1:3)=pere(1:3);
    enfant1(4:5)=mere(4:5);
    enfant2(1:3)=mere(1:3);
    enfant2(4:5)=pere(4:5);
    Enfants(2*i-1,:)=enfant1;
    Enfants(2*i,:)=enfant2;
end


end