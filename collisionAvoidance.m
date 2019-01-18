function collision  = collisionAvoidance(sensor)
%%Funktion zur Detektion eines Hindernisses bzw. fahrbares Objekt
if(min(sensor(:,1)) <= 200)
    disp('Achtung Gefahr');
    arrobot_stop();
    arrobot_setdeltaheading(180);
    pause(7);
    arrobot_setvel(300);
    arrobot_stop();
end

end

