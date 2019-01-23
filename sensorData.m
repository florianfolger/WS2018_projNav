function [sData xR yR] = sensorData(sensorDistance,map)
%% Sensorkoordinaten relativ zum Roboter, Winkel, Polarkoordinaten
%INIT
x = arrobot_getx()+5000;
y = arrobot_gety()+5000;
xy = [x y]/1000;
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
for k = 1:length(sensorDistance(:,1))
    if sensorDistance(k,1) < 5000
        deltaY = (((sensorDistance(k,1) + hypot(spose(k,1), spose(k,2))) * sind(spose(k,3) + alpha)) + y) / 1000;
        deltaX = (((sensorDistance(k,1) + hypot(spose(k,1), spose(k,2))) * cosd(spose(k,3) + alpha)) + x) / 1000;
        sData(k,1:2) = [deltaX; deltaY];
        % detect collision

        % OccupancyGrid
        setOccupancy(map, sData, ones(1,1));
        figure(1)
        grid on;
        show(map);
        hold on;
        
    end
    % RoboterPose
    plot(x/1000,y/1000,'*r');
    hold on;
end

xR = x/1000;
yR = y/1000;

end

