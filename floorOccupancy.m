function occ = floorOccupancy(floorplan)
%% Funktion zum Ploten des 3. Stockwerks der Hochschule München

for i=1:length(floorplan(:,1))
    floorplan(i,1:2) = [floorplan(i,1) floorplan(i,2)] / 1000;
end

% floorplan um min verschieben
floorplan(:,1) = -min(floorplan(:,1)) + floorplan(:,1);
floorplan(:,2) = -min(floorplan(:,2)) + floorplan(:,2);

% grid size abfragen
max_x = max(floorplan(:,1));
max_y = max(floorplan(:,2));

% Binary OccupancyGrid
occ_bin = robotics.BinaryOccupancyGrid((round(max_x)+1),(round(max_y)+1), 5);
% Occupancy Grid
occ = robotics.OccupancyGrid((round(max_x)+1),(round(max_y)+1), 5);

% projektion auf xy coordinaten
XY = floorplan(:,1:2);

% occ grid erstellen
setOccupancy(occ_bin, XY, ones(length(XY),1));
setOccupancy(occ, XY, ones(length(XY),1));
inflate(occ_bin,0.2);
inflate(occ,0.2);

% ploten der Grids
figure(3);
show(occ_bin);
figure(4)
show(occ);

end