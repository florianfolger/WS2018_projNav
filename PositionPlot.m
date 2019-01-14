function posi = PositionPlot(x,y,alpha)
%% Funktion zum ploten der Karte
figure(1);
% Anzahl der Sensoren
n = arrobot_getnumsonar()


%% Berechnen der Polarkoordinaten
for i=1:10
    for k=1:16
        sensor(i,k) = arrobot_getsonarrange(k-1);
        koppel = Koppelnavi(x,x_neu,y,y_neu,alpha);
        figure(2)
        plot(koppel(1,1), koppel(1,2))
        hold on
        plot(sensor(i,k))
    end
end
% Plot
hold on;
plot(x, y, '*')
pause(0.5);
sensor
posi = [x,y,alpha];

end

