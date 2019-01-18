function rotation = angle(xCor,yCor)
%% Funktion damit der Roboter sich einem gegebenen Punkt orientiert
% INIT
xR = (arrobot_getx()+5000) / 1000;
yR = (arrobot_gety()+5000) / 1000;
thR = arrobot_getth();
dt =  (atan2(yCor - yR, xCor - xR) * (180/pi)) - thR;
dt = mod((dt + 180), 360) - 180;
arrobot_setdeltaheading(dt);
pause(5);

end
