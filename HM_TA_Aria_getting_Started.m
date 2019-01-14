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

ver

%% MobileSim starten
% Ausführen der MobileSimStart.txt Datei in einer beliebigen Shell

%% Aria Pfad und Neustart
% ==> notwendiger work around
% pfad hinzufügen
% addpath('C:\HM\prj\MobileRobots\ARIA_2.9.1 (64-bit)_matlab_precompiled');
addpath('C:\Users\Sysadmin\Desktop\WS2018_projNav\ARIA_2.9.1 (64-bit)_matlab_precompiled');

% disconnet robot
arrobot_disconnect
% nochmals clear notwendig
clear all
% pfad hinzufügen
addpath('C:\Users\Sysadmin\Desktop\WS2018_projNav\ARIA_2.9.1 (64-bit)_matlab_precompiled');
% <==

%% connect to the robot:
% aria_init -rh 10.22.192.161  -rrtp 8101
% Roboter 1
aria_init -rh 10.22.195.192  -rrtp 8101 % cmd ipconfig
% Roboter 2
% aria_init -rh 10.22.195.192  -rrtp 8102
arrobot_connect

%% make the robot drive in a small circle:
arrobot_setvel(0) % Current Position from Roboter, 300
arrobot_setrotvel(0) % translational velocity, 35

%% simple Steuerung
% press e.g e to stop the movement
value = 1;
while value
    reply = input('Enter control command \n', 's');
    switch reply
        case 'w' %forward
            arrobot_setvel(300);
            pause(2);
            x = arrobot_getx();
            y = arrobot_gety();
            alpha = arrobot_getth()*pi/180;
            arrobot_stop;
            posi = PositionPlot(x,y,alpha);
            value = 1;
            continue;
        case 's' %backwards
            arrobot_setvel(-300);
            pause(2);
            x = arrobot_getx();
            y = arrobot_gety();
            alpha = arrobot_getth()*pi/180;
            arrobot_stop;
            posi = PositionPlot(x,y,alpha);
            value = 1;
            continue;
        case 'a' %left
            arrobot_setrotvel(30);
            pause(1);
            x = arrobot_getx();
            y = arrobot_gety();
            alpha = arrobot_getth()*pi/180;
            arrobot_stop;
            posi = PositionPlot(x,y,alpha);
            value = 1;
            continue;
        case 'd' %right
            arrobot_setrotvel(-30);
            pause(1);
            x = arrobot_getx();
            y = arrobot_gety();
            alpha = arrobot_getth()*pi/180;
            arrobot_stop;
            posi = PositionPlot(x,y,alpha);
            value = 1;
            continue;
        case 't' %turn 180°
            arrobot_setrotvel(180);
            pause(1);
            x = arrobot_getx();
            y = arrobot_gety();
            alpha = arrobot_getth()*pi/180;
            arrobot_stop;
            posi = PositionPlot(x,y,alpha);
            value = 1;
            continue;
        case 'b' %exit while
            value = -1;
            break;
    end
end


%% pause und disconnect
pause(2);
arrobot_disconnect
