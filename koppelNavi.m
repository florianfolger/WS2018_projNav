function [xK yK alphaK] = koppelNavi(x,y,alpha)
%% Funktion um eine Bewegung zu berechnen

x_neu = 3000;
y_neu = 3000;

xK = (x + x_neu * cos(alpha)) / 1000;
yK = (y + y_neu * sin(alpha)) / 1000;
alphaK = atan2(y_neu,x_neu);

end

