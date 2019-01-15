function [X Y xR yR] = sensorData(sensorDistance,map)
%% Sensorkoordinaten relativ zum Roboter, Winkel, Polarkoordinaten
%INIT
x = arrobot_getx()+10000;
y = arrobot_gety()+10000;
alpha = arrobot_getth();

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
    -0.203 0.119 130
    -0.157 0.136 90];

% Berechnung der Polarkoordinaten
for i = 1:16
    if sensorDistance(i,1) < 5000
        deltaY = (sensorDistance(i,1) * sind(spose(i,3) + alpha) + y) / 1000;
        deltaX = (sensorDistance(i,1) * cosd(spose(i,3) + alpha) + x) / 1000;
        sData(i,1:2) = [deltaX; deltaY];
        %         plot(sData(i,1), sData(i,2), '.b');
        %         hold on;
        %         axis equal;
        setOccupancy(map, sData, ones(1,1));
        show(map);
        grid on;
        hold on;
    end
    hold on;
    plot(x/1000,y/1000,'.r');
    hold on;
end


X = sData(:,1);
Y = sData(:,2);
xR = x/1000;
yR = y/1000;
% xyR = [xR yR];


end

