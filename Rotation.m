function [Sommets] = Rotation(Sommets,alpha,centre_bat)
% [Sommets] = Rotation(Sommets,angle,centre_bat)
% La fonction va faire tourner le bâtiment d'un angle alpha dans le sens
% trigonométrique, autour de centre_bâtiment
Rot = [cos(alpha) sin(alpha) 0
    -sin(alpha) cos(alpha) 0
    0 0 1];
Sommets = (Sommets-[centre_bat(1) centre_bat(2) 0])*Rot+[centre_bat(1) centre_bat(2) 0];