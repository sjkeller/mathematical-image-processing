clear all
close all
clc

phi = pi/4;
A = imread('mandril_color.png');
% method = 'nearestneighbor';
method = 'bilinear';
B = rotateImg(A, phi, method);

figure
image(A)
figure
image(B)
 