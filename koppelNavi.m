function koppel = koppelNavi(xR,yR,alphaR,xBox,yBox)
%% Funktion um eine Bewegung zu berechnen

xK = (xR + xBox * cos(alphaR)) / 1000;
yK = (yR + yBox * sin(alphaR)) / 1000;
alphaK = atan2(yR,xR);

koppel = [xK yK alphaK];

end

