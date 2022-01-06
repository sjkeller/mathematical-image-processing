clear all
close all
clc

moon_img = imread("moon.png");
moon_img_sharpened = laplaceSharpening(moon_img, 0.7);
figure
imshow(moon_img)
figure
imshow(moon_img_sharpened)