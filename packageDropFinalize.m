function autonom = packageDropFinalize(distance,box)
%% INIT
% Methode welche den Roboter autonom zum Briefkasten f�hrt
value = 1;
if value == 1
    while value
        % Autonom fahren wenn die Distanz kleiner und gr��er der
        % Schwellwerte sind, aus der main und boxLocation
        [distance,box] = boxlocation(box);
        if min(distance(:,1)) < 1.5 & min(distance(:,1)) > 0.40
            [distance,box] = boxlocation(box);
            [val, idx] = min(distance(:,1));
            angle(box(idx,1), box(idx,2));
            arrobot_setvel(50);
            pause(1.5);
            arrobot_stop;
            value = 1;
            continue;
        else
            value = -1;
            break;
        end
    end
end

autonom = true;

end

