% -----------------------------
% Hochschule München
% Fakultät für Geoinformation
% Thomas Abmayr
% 22.10.2018
% -----------------------------

%% Define computer-specific variables
ipA = '10.22.192.105';   portA = 0;   % Modify these values to be those of your first computer.
ipB = '10.22.192.104';  portB = 4000;  % Modify these values to be those of your second computer.
%% Create UDP Object
udpA = udp(ipB,portB,'LocalPort',portA);
%% Connect to UDP Object
fopen(udpA);

while (true)
    d = udpA
    fprintf(udpA,'This is test message number one.')
    fprintf(udpA,'This is test message number two.')
end


%% Clean Up Machine A
fclose(udpA)
delete(udpA)
clear ipA portA ipB portB udpA