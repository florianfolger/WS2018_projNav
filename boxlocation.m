function [boxDistanceNew, boxNew] = boxLocation(box)
%% INIT
% Methode welche Distanzen vom Briefkasten zum Roboter misst
xR = (arrobot_getx()+5000)/1000;
yR = (arrobot_gety()+5000)/1000;
idx = 0;
for i=1:length(box(:,1))
    boxDistance(i,1) = hypot(box(i,1)-xR,box(i,2)-yR);
    boxDistanceNew(i,1) = boxDistance(i,1);
    boxNew(i,1:2) = box(i,1:2);
    % Falls Schwellwert erreicht
    if boxDistance(i,1) <= 1.5
        arrobot_stop;
        disp(['Entfernung zu Box: ', num2str(boxDistance(i,1))])
    end
    % Falls Briefkasten erreicht String ausgabe
    if boxDistance(i,1) <= 0.40
        disp(['Box erreicht'])
        arrobot_stop;
        boxDistance(i,:) = [];
        idx = i + 1;
    end
end
% Box und Distanz kopieren und mit neuen Werten überschreiben
if idx > 0
    N=1;
    for i=1:length(box(:,1))
        if idx == i
            boxNew(N,:) = box(i,:);
            boxDistanceNew(N,:) = boxDistance(i,:);
            % löschen der erreichten Box und Distanz
            boxNew(idx-1,:) = [];
            boxDistanceNew(idx-1,:) = [];
            N=N+1;
        end
    end
end

end


