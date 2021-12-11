function [U] = peronaMalikSteps(U_0,kappa,nsteps,dt)
%PERONAMALIKSTEPS Explicit Euler Iterations for Perona Malik Equation
%
%See also.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% pad image with zeros and convert image
dU_0 = zeros(size(U_0) + 4);
dU_0(3:end - 2, 3:end - 2) = im2double(U_0);

g = @(s) 1 ./ (1 + (s.^2)/(kappa^2));

for i=1:nsteps
    % filter for calculating deltas of image and their neighbours
    lower = filter2([0 0 0; 0 -1 0; 0 1 0], dU_0);
    right = filter2([0 0 0; 0 -1 1; 0 0 0], dU_0);

    scaled_lower = (g(lower) .* (lower));
    scaled_right = (g(right) .* (right));
    
    lower2 = filter2([0 0 0; 0 -1 0; 0 1 0], scaled_lower);
    right2 = filter2([0 0 0; 0 -1 1; 0 0 0], scaled_right);
    
    % apply calculated deltas to image pixels and its neighbours (step)
    dU_0 = dU_0 + dt * (lower2 + right2);
end

% reverse image conversion
U = im2uint8(dU_0(3:end - 2, 3:end - 2));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%by Sergej Keller, Lennart Scherz, Pascal Urban
