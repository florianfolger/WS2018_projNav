function collision  = collisionAvoidance(sensor,k)
%%Funktion zur Detektion eines Hindernisses bzw. fahrbares Objekt
    % Vorderen zwei Sensoren sind 4,5
    if k == 4 || k == 5
        if(sensor <= 350)
            disp('Achtung Gefahr');
            arrobot_stop();
            arrobot_setdeltaheading(180);
            pause(7);
            arrobot_setvel(150);
            pause(1);
            arrobot_stop();
        end
        
    end
    if k == 12 || k == 13
        % Hinteren zwei Sensoren sind 12,13
        if(sensor <= 350)
            disp('Achtung Gefahr');
            arrobot_stop();
            arrobot_setvel(150);
            pause(1);
            arrobot_stop();
        end
    end
    
    % Seitlichen Sensoren
    if k == 1 || k == 8
        if(sensor <= 150)
            disp('Achtung Gefahr');
            arrobot_stop();
            arrobot_setvel(-300);
            pause(1);
            arrobot_stop();
        end
    end
    if k == 9 || k == 16
        if (sensor <= 150)
            disp('Achtung Gefahr');
            arrobot_stop();
            arrobot_setvel(-300);
            pause(1);
            arrobot_stop();
        end
    end
end


