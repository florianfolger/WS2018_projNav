function [X Y alpha] = sensorData(xR,xS,yR,yS,alpha)
%Sensorkoordinaten relativ zum Roboter, Winkel
%%INIT
spose = [0.069 0.136 90,
    0.114 0.119 50,
    0.148 0.078 30,
    0.166 0.027 10,
    0.166 -0.027 -10,
    0.148 -0.078 -30,
    0.114 -0.119 -50,
    0.069 -0.136 -90,
    -0.157 -0.136 -90,
    -0.203 -0.119 -130,
    -0.237 -0.078 -150,
    -0.255 -0.027 -170,
    -0.255 0.027 170,
    -0.237 0.078 150,
    -0.157 0.136 90];
%offsetwinkel relativ vom robo zum sensor
for i=1:16
    offset = atan2(spose(:,2),spose(:,1)) * 180/pi
end
%%
s = sqrt((yS-yR)^2 -(xS-xR)^2);

end

