function [X Y xR yR] = sensorData(sensorDistance,map)
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
% nData.measurement = [];
% measurement = {'m1';'m2';'m3';'m4';'m5';'m6';'m7';'m8';'m9';'m10'};
for k = 1:16
    if sensorDistance(k,1) < 5000
        deltaY = (sensorDistance(k,1) * sind(spose(k,3) + alpha) + y) / 1000;
        deltaX = (sensorDistance(k,1) * cosd(spose(k,3) + alpha) + x) / 1000;
        sData(k,1:2) = [deltaX; deltaY];
%         for i = 1:length(measurement)
%             nData.measurement(k).(measurement{i}) = sData(k,1:2);
%         end
        %         plot(sData(i,1), sData(i,2), '.b');
        %         hold on;
        %         axis equal;
        setOccupancy(map, sData, ones(1,1));
        show(map);
        grid on;
        hold on;
    end
    %     % für trajektorie.txt datei
    %     hold on;
    %     plot(x/1000,y/1000,'.r');
    %     hold on;
end



X = sData(:,1);
Y = sData(:,2);
xR = x/1000;
yR = y/1000;
% xyR = [xR yR];


end

