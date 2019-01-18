function am = automove(distance,point)
%% Funktion damit der Roboter autonom sich fortbewegt
%INIT
value = 1;

while value == 1
    % Roboterkoordinaten updaten
    xR = (arrobot_getx()+5000) / 1000;
    yR = (arrobot_gety()+5000) / 1000;
    distance = hypot(point(1,1)-xR(1,1),point(1,2)-yR(1,1));
    % Schwellwert damit der Roboter stoppt
    if distance > 0.25
        arrobot_setvel(300);
        pause(1.5);
        arrobot_stop;
        value = 1;
        continue;
    else
        value = -1;
        break
    end
end
am = true;
end



