function autonom = packageDropFinalize(distance,box)
%% INIT
% Methode welche den Roboter autonom zum Briefkasten fährt
value = 1;
if value == 1
    while value
        % Autonom fahren wenn die Distanz kleiner und größer der
        % Schwellwerte sind, aus der main und boxLocation
        [distance,box] = boxLocation(box);
        if min(distance(:,1)) < 1.5 & min(distance(:,1)) > 0.40
            [distance,box] = boxLocation(box);
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

