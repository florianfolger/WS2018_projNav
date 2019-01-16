function home = homing(file)
%% Funktion die den Roboter zu seinem Startpunkt zur�ckf�hrt
%INIT

traj = load(file);
x = traj(:,1);
y = traj(:,2);

xf = flipud(x);
yf = flipud(y);

home = [xf yf];
end

