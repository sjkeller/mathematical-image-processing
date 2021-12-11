function [U] = peronaMalikSteps(U_0,kappa,nsteps,dt)
%PERONAMALIKSTEPS Explicit Euler Iterations for Perona Malik Equation
%
%See also.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% pad image with zeros and convert image
%dU_0 = zeros(size(U_0));
dU_0 = im2double(U_0);

g = @(s) 1 ./ (1 + (s.^2)/(kappa^2));

for i=1:nsteps
    % filter for calculating deltas of image and their neighbours
    upper = filter2([0 1 1; 0 -1 0; 0 0 0], dU_0);
    lower = filter2([0 0 0; 0 -1 0; 0 1 0], dU_0);
    right = filter2([0 0 0; 0 -1 1; 0 0 0], dU_0);
    left = filter2([0 0 0; 1 -1 0; 0 0 0], dU_0);

    % apply calculated deltas to image pixels and its neighbours (step)
    dU_0 = dU_0 + dt .* (g(upper) * upper + g(lower) * lower + g(right) * right + g(left) * left);
end

% reverse image conversion
U = im2uint8(dU_0);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%by Sergej Keller, Lennart Scherz, Pascal Urban
