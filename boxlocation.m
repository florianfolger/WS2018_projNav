function boxdistance = boxlocation()
%box1 X16, Y5; box2 X16 Y 14
%param
bxy = [16 5; 16 14];
xR = (arrobot_getx()+5000)/1000;
yR = (arrobot_gety()+5000)/1000;

d = sqrt((bxy(1,1)-xR)^2 + (bxy(1,2)-yR)^2);
boxdistance = d;
if d <= 1.5
    disp(['Entfernung zu Box1 '+ num2str(d)]);
end

