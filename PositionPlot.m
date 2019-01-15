function posi = PositionPlot(x,y,alpha)
%% Funktion zum ploten der Karte
figure(1);
% Anzahl der Sensoren
n = arrobot_getnumsonar();


%% Berechnen der Polarkoordinaten
for i=1:10
    for k=1:16
        sensor(k,i) = arrobot_getsonarrange(k-1);
    end
    [x y alpha] = sensorData(sensor(:,i),x,y,alpha);
    plot(x(:,1), y(:,1))
    hold on;
end
% Plot
% hold on;
% plot(X, Y, '.')
% pause(0.5);

posi = [x,y,alpha];

end

