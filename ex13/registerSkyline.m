%REGISTERSKYLINE
%
%See also .
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
close all
clc

% load images
left_img = imread('skyline_left', 'png');
right_dist = imread('skyline_right_dist', 'png');

% manually determined pixel positions
left_coords =  [6,401; 128,364; 154,434] - [0, size(left_img,2)-150];
right_coords = [6,196; 128, 78; 154,141];

% initial parameters
parameter_0 = [1,1,1];

% optimize parameters
target = @(parameter) target_func(parameter, left_coords, right_coords);
[opt_param, val] = fmincon(target, parameter_0, [],[]);
disp(opt_param);

% transform right image
right_orig = inverseTrafo(opt_param, right_dist);
imshow(right_orig)

% combine images
img_whole = [left_img, right_orig(:,150:end)];
imshow(img_whole);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% by Sergej Keller, Lennart Scherz, Pascal Urban
