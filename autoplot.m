function autoplot = autoplot(map)
%Funktion Plotten während der Autonombewegung
% while value

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
for k=1:16
    sensor(k,1) = arrobot_getsonarrange(k-1);  
    if sensor(k,1) < 5000
      deltaY = (sensor(k,1) * sind(spose(k,3) + alpha) + y) / 1000;
        deltaX = (sensor(k,1) * cosd(spose(k,3) + alpha) + x) / 1000;
        sData(k,1:2) = [deltaX; deltaY];
        % Plot
        figure(2)
        grid on;
        plot(sData(k,1), sData(k,2), '.b');
        hold on;
        % OccupancyGrid
        setOccupancy(map, sData, ones(1,1));
%         figure(1)
%         show(map);
%         hold on;
    end
end


