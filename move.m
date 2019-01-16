function move = move(x, y)
distThresh = 400;
angleTresh = 0.5;
velMult = 0.5;
rx = arrobot_getx;
ry = arrobot_gety;
rth = arrobot_getth;

d = sqrt((x-rx)^2 + (y -ry)^2)
while(d > distThresh)
    arrobot_setvel(300);
    pause(1);
    arrobot_stop;
    rx = arrobot_getx;
    ry = arrobot_gety;
    rth = arrobot_getth;
    %     xpositions = [xpositions rx];
    %     ypositions = [ypositions ry];
    d = sqrt((x-rx)^2 + (y -ry)^2)
    %     disp('Distance'+ d)
    if d < 2000
        arrobot_stop;
    end
    if d < distThresh
        arrobot_stop;
    end
end
    
