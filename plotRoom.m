function plotRoom(room_dimensions,receiver_coords,source_coords,figHandle)
% PLOTROOM Plot room, transmitter and receiver

figure(figHandle)

X = [0;room_dimensions(1);room_dimensions(1);0;0];
Y = [0;0;room_dimensions(2);room_dimensions(2);0];
Z = [0;0;0;0;0];

figure;
hold on;

% draw a square in the xy plane with z = 0
plot3(X,Y,Z,"k","LineWidth",1.5);

% draw a square in the xy plane with z = 1
plot3(X,Y,Z+room_dimensions(3),"k","LineWidth",1.5);

% set the azimuth and elevation of the plot
set(gca,"View",[-28,35]);

% draw 4 pillows
for k=1:length(X)-1
    plot3([X(k);X(k)],[Y(k);Y(k)],[0;room_dimensions(3)],"k","LineWidth",1.5);
end

grid on
xlabel("X (m)")
ylabel("Y (m)")
zlabel("Z (m)")

% plot points of the source and receiver 
plot3(source_coords(1),source_coords(2),source_coords(3),"bx","LineWidth",2)
plot3(receiver_coords(1),receiver_coords(2),receiver_coords(3),"ro","LineWidth",2)

% plot auxiliary lines for the source
plot3([source_coords(1);source_coords(1)], ...
    [source_coords(2);source_coords(2)], ...
    [0;source_coords(3)],"b:","LineWidth",1);

plot3([0;source_coords(1)], ...
    [source_coords(2);source_coords(2)], ...
    [0;0],"b:","LineWidth",1);

plot3([source_coords(1);source_coords(1)], ...
    [0;source_coords(2)], ...
    [0;0],"b:","LineWidth",1);

% plot auxiliary lines for the receiver
plot3([receiver_coords(1);receiver_coords(1)], ...
    [receiver_coords(2);receiver_coords(2)], ...
    [0;receiver_coords(3)],"r:","LineWidth",1);

plot3([0;receiver_coords(1)], ...
    [receiver_coords(2);receiver_coords(2)], ...
    [0;0],"r:","LineWidth",1);

plot3([receiver_coords(1);receiver_coords(1)], ...
    [0;source_coords(2)], ...
    [0;0],"r:","LineWidth",1);
end