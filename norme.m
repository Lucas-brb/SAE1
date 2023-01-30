function [s] = norme(Vect)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
S = 0;
for i = 1:length(Vect);
    S = S + Vect(i)^2;
s = sqrt(S);
end