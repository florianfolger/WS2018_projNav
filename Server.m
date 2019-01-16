function server = Server()
%% Server der Briefkästen abfrägt auf eine bestimmte Distanz
% IP des Servers
ipServer = '10.22.195.193';   portServer = 4007;
% IP des Clients
ipClient = '10.22.195.192';  portClient = 6008;
%% Create UDP Object
udpClient = udp(ipServer,portServer, 'LocalPort', portClient);

%% Connect to UDP Object
fclose(udpClient)

fopen(udpClient);

while (true)
    
    fscanf(udpClient)
    fscanf(udpClient)
    
end

fclose(udpClient)
delete(udpClient)
clear ipA portA ipB portB udpB notes
end

