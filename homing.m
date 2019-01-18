function home = homing(xR,yR,cornerPoints,map)
%% Funktion die den Roboter zu seinem Startpunkt zurückfährt
%INIT
cornerPoint = [5 5; 16 5; 16.35 11.65; 5 11.65];
% true
value = 1;
tol = 0.3;
while value == 1
    xR = (arrobot_getx()+5000) / 1000;
    yR = (arrobot_gety()+5000) / 1000;
    robo = [xR yR];
    for i=1:length(cornerPoints(:,1))
        distance(i,1) = hypot(cornerPoints(i,1)-xR(1,1),cornerPoints(i,2)-yR(1,1));
    end
    if min(distance(:,1)) > 0.01
        [val, idx] = min(distance(:,1));
        % Schwellwert für die Koordinaten der Eckpunkte 2-4
        threshP2 = (robo(1,:) <= cornerPoint(2,:)+tol)&(robo(1,:) >= cornerPoint(2,:)-tol);
        threshP3 = (robo(1,:) <= cornerPoint(3,:)+tol)&(robo(1,:) >= cornerPoint(3,:)-tol);
        threshP4 = (robo(1,:) <= cornerPoint(4,:)+tol)&(robo(1,:) >= cornerPoint(4,:)-tol);
        % Prüfe Schwellwert ob ein Eckpunkt erreicht wurde
        if threshP2(1,:) == 1 | threshP4(1,:) == 1
            corner = cornerPoint(1,:);
            angle(corner(1,1),corner(1,2));
            am = automove(val,cornerPoint(1,:),map);
        else
            % sucht seine näheste Ecke
            corner = cornerPoint(idx,:);
            angle(corner(1,1),corner(1,2));
            am = automove(val,cornerPoint(idx,:),map);
        end
        % Prüfe Schwellwert für den Eckpunkt 3
        if threshP3(1,:) == 1
            corner = cornerPoint(2,:);
            angle(corner(1,1),corner(1,2));
            am = automove(val,cornerPoint(2,:),map);
        end
        % Point 1, exit
        startPoint = (robo(1,:) <= cornerPoint(1,:)+tol)&(robo(1,:) >= cornerPoint(1,:)-tol);
        if startPoint(1,:) == 1
            value = -1;
            disp('Startpunkt erreicht');
            break;
        end
        continue;
    else
        value = -1;
        break
    end
end
home = true;

end

