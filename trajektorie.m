function [x y] = trajektorie(file)
%% Laden der gefahrenen Trajektorie
traj = load('xyRobo.txt');

x = traj(:,1);
y = traj(:,2);

end

