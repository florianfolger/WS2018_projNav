function koppel = Koppelnavi(x,x_neu,y,y_neu,alpha)
%% Funktion um eine Bewegung zu berechnen
x_neu = x + x_neu * cos(alpha);
y_neu = y + y_neu * sin(alpha);
alpha = atan2(y_neu,x_neu);

koppel = [x_neu y_neu alpha];

end

