% -------------------------------------------------------------------
% Adept MobileRobots Robotics Interface for Applications (ARIA)
% Copyright (C) 2004-2005 ActivMedia Robotics LLC
% Copyright (C) 2006-2010 MobileRobots Inc.
% Copyright (C) 2011-2014 Adept Technology
% -------------------------------------------------------------------
% mod by T. Abmayr Jan. 2016
% -------------------------------------------------------------------

clear all;
close all;
clc;

% ver;

%% Profile on
profile on;
tic

%% MobileSim starten
% Ausf�hren der MobileSimStart.txt Datei in einer beliebigen Shell

%% Aria Pfad und Neustart
% ==> notwendiger work around
% pfad hinzuf�gen
% addpath('C:\HM\prj\MobileRobots\ARIA_2.9.1 (64-bit)_matlab_precompiled');
addpath('C:\Users\Sysadmin\Desktop\WS2018_projNav\ARIA_2.9.1 (64-bit)_matlab_precompiled');

% disconnet robot
arrobot_disconnect;
% nochmals clear notwendig
clear all
% pfad hinzuf�gen
addpath('C:\Users\Sysadmin\Desktop\WS2018_projNav\ARIA_2.9.1 (64-bit)_matlab_precompiled');
% <==

%% connect to the robot:
% aria_init -rh 10.22.192.161  -rrtp 8101
% Roboter 1
aria_init -rh 10.22.195.192  -rrtp 8104; % cmd ipconfig
% Roboter 2
% aria_init -rh 10.22.195.192  -rrtp 8105
arrobot_connect;

%% make the robot drive in a small circle:
arrobot_setvel(0); % Current Position from Roboter, 300
arrobot_setrotvel(0); % translational velocity, 35

%% Laden der Flurkoordinaten
floor = load('floorplan.txt');
%% Briefk�sten mit ihren Koordinaten
%letzte Box mit hohen Wert damit keine Dauerschleife ensteht
box = [16 5; 16.35 11.65; 5 11.4; 100 100];
value = 1;
% OccupancyGrid
map = robotics.BinaryOccupancyGrid(25,20,5);
fid = fopen('trajektorie.txt','w');
%fidHome = fopen('home.txt','w');
%% Eckpunkte f�r Homing
cornerPoints = [5 5; 16 5; 16.35 11.65; 5 11.65];

%% simple Steuerung
% press e.g e to stop the movement
if value == 1
    while value
        %stop nach jedem vorgang
        pause(1.5);
        arrobot_stop;
        value = 1;
        
        %Sensordaten 16
        for k=1:16
            sensor(k,1) = arrobot_getsonarrange(k-1);
            collisionAvoidance(sensor(k,1),k);
        end
        
        %Eingabe f�r Steuerung
        reply = input('Enter control command \n', 's');
        
        %Sensordaten umwandeln und Punkte plotten
        [sData xR yR] = sensorData(sensor,map);
        xyR = [xR yR];
        
        %Trajektorie in einem File speichern
        fprintf(fid,'%s\n',num2str(xyR));
        switch reply
            case 'w' %forward
                arrobot_setvel(600);
                pause(1.5);
                arrobot_stop;
                continue;
            case 's' %backwards
                arrobot_setvel(-600);
                continue;
            case 'a' %left
                arrobot_setdeltaheading(30);
                pause(5);
                continue;
            case 'd' %right
                arrobot_setdeltaheading(-30);
                pause(5);
                continue;
            case '0'
                arrobot_setdeltaheading
            case 't' %turn 180�
                arrobot_setdeltaheading(180);
                pause(7);
                continue;
            case 'p' %plot roboweg
                [x y] = trajektorie('trajektorie.txt');
                setOccupancy(map, sData, ones(1,1));
                figure(2)
                show(map);
                grid on;
                hold on;
                roboweg = plot(x,y,'*r');
                hold on;
                continue;
                
            case 'pAll'
                floorOcc = floorOccupancy(floor);
                continue;
            case 'e' %erase
                if reply == 'p'
                    delete(roboweg);
                end
            case 'box'
                
                [distanceBox, boxNew] = boxlocation(box);
                box = boxNew;
                % Autonomes fahren
                if min(distanceBox(:,1)) < 1.5 & min(distanceBox(:,1)) > 0.40
                    
                    [distanceClose,boxNew] = boxlocation(box);
                    
                    autonom = packageDropFinalize(distanceClose(:,1),box);
                    
                end
                
                continue;
            case 'h' % robo drives to his start coordinates
                home = homing(xR,yR,cornerPoints,map);
            case 'b' %exit while
                value = -1;
                break;
        end
        
    end
end
profile viewer
toc
%% pause und disconnect
% pause(2);
arrobot_disconnect;