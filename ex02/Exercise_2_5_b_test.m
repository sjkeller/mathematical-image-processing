clear all
close all
clc

x = [0,2,2,0,0];
y = [0,0,1,1,0];
phi = pi/2;

D = [cos(phi), -sin(phi); ...
     sin(phi),  cos(phi)];

D_inv = D.';

X_m = [1;0.5];

figure
hold on
line(x,y)

X = [x;y];

X_u =(D*(X-X_m))+X_m;

x_u = X_u(1,:);
y_u = X_u(2,:);


line(x_u,y_u)
