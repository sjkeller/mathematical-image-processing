function [B, D] = laplaceSharpening(A,tau)
%LAPLACESHARPENING Apply Laplace sharpening
%
%   See also .
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% YOUR CODE HERE
A_double = im2double(A);
lap_mask = 1/5*[0,1,0;1,-4,1;0,1,0];
lap_A = imfilter(A_double, lap_mask);
B = A_double-tau*lap_A;
B = normalize(B);
B = im2uint8(B);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% by Sergej Keller, Lennart Scherz, Pascal Urban
