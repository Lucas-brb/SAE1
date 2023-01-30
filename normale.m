function [N] = normale(A,B,C)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
N = (cross(B-C,C-A))/norme(cross(B-A,C-A));
end