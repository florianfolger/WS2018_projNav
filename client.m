function client()
disp('hi');
data = sin(1:64);
figure(4)
plot(data);

t = tcpip('19.22.195.192', 30000, 'NetworkRole', 'client');
disp('connected')
fopen(t);
disp('write data')
fwrite(t,data);