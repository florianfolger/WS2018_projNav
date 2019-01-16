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

% ver;

%% MobileSim starten
% Ausf�hren der MobileSimStart.txt Datei in einer beliebigen Shell

%% Aria Pfad und Neustartw

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
aria_init -rh 10.22.195.192  -rrtp 8102; % cmd ipconfig
% Roboter 2
% aria_init -rh 10.22.195.192  -rrtp 8102
arrobot_connect;

%% make the robot drive in a small circle:
arrobot_setvel(0); % Current Position from Roboter, 300
arrobot_setrotvel(0); % translational velocity, 35

%% simple Steuerung
% press e.g e to stop the movement
value = 1;
% OccupancyGrid
map = robotics.BinaryOccupancyGrid(25,25,7);

fid = fopen('trajektorie.txt','w');
%fidHome = fopen('home.txt','w');

while value
    %stop nach jedem vorgang
    distanceBox = boxlocation()
    pause(1);
    arrobot_stop;
    value = 1;
    %Eingabe f�r Steuerung
    reply = input('Enter control command \n', 's');
    %Sensordaten 16
    for k=1:16
        sensor(k,1) = arrobot_getsonarrange(k-1);
    end
    %Sensordaten umwandeln und Punkte plotten
    [x_sensorData y_sensorData xR yR] = sensorData(sensor,map);
    xyR = [xR yR];
    %Umgebung plotten
    fprintf(fid,'%s\n',num2str(xyR));
    switch reply
        case 'w' %forward
            arrobot_setvel(300);
            continue;
        case 's' %backwards inactive
            arrobot_setvel(-600);
            continue;
        case 'a' %left
            arrobot_setrotvel(30);
            continue;
        case 'd' %right
            arrobot_setrotvel(-30);
            continue;
        case 't' %turn 180�
            arrobot_setrotvel(180);
            pause(1.9);
            arrobot_stop;
            value = 1;
            continue;
        case 'p' %plot roboweg
            [x y] = trajektorie('trajektorie.txt');
            roboweg = plot(x,y,'.r');
            value = 1;
            continue;
        case 'e' %erase
            if reply == 'p'
                delete(roboweg);
                value = 1;
            end
        case 'h'
            home = homing('trajektorie.txt');
            for i=1:length(home(:,1))
                
            end
        case 'test'
            move(3200,0);
            Curx = arrobot_getx();
            Cury =arrobot_gety()
        case 'b' %exit while
            value = -1;
            break;
    end
    
end


%% pause und disconnect
pause(2);
arrobot_disconnect;
