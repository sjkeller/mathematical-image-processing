function [U] = heatEquationStep(U_0,dt)
%HEATEQUATIONSTEP Explicit Euler step for the heat equation
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% pad image with zeros and convert image
dU_0 = zeros(size(U_0) + 2);
dU_0(2:end - 1, 2:end - 1) = im2double(U_0);

% Neumann condition -> gradient at boundary is zero
dU_0(1, 1:end) = dU_0(2, 1:end);
dU_0(end, 1:end) = dU_0(end - 1, 1:end);
dU_0(1:end, 1) = dU_0(1:end, 2);
dU_0(1:end, end) = dU_0(1:end, end - 1);

% filter for calculating deltas of image and their neighbours
upper = filter2([0 1 0; 0 -1 0; 0 0 0], dU_0);
lower = filter2([0 0 0; 0 -1 0; 0 1 0], dU_0);
right = filter2([0 0 0; 0 -1 1; 0 0 0], dU_0);
left = filter2([0 0 0; 1 -1 0; 0 0 0], dU_0);

% apply calculated deltas to image pixels and its neighbours (step)
dU_0 = dU_0 + dt .* (upper + lower + right + left);

% reverse image conversion
U = im2uint8(dU_0(2:end - 1, 2:end - 1));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%by Sergej Keller, Lennart Scherz, Pascal Urban
