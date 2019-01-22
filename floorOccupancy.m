function floorOcc = floorOccupancy(floorplan)
%% Funktion zum Ploten des 3. Stockwerks der Hochschule Münchens

floor_binOcc = robotics.BinaryOccupancyGrid(6.5,3,30);
floorOcc = robotics.OccupancyGrid(6.5,3,50);

for i=1:length(floorplan(:,1))
    floor_occ(i,1:2) = [floorplan(i,1) floorplan(i,2)];
end

setOccupancy(floor_binOcc, floor_occ, ones(1,1));
% setOccupancy(floorOcc, floor_occ, ones(1,1));
figure(1)
show(floor_binOcc);
grid on;
%plot(floor_occ(:,1), floor_occ(:,2), '.b')
%axis equal;
end