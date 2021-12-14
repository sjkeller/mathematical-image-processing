function [U] = peronaMalikSteps(U_0,kappa,nsteps,dt)
%PERONAMALIKSTEPS Explicit Euler Iterations for Perona Malik Equation
%
%See also.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% filter for calculating deltas of image and their neighbours
upper = [0 1 0; 0 -1 0; 0 0 0];
lower = [0 0 0; 0 -1 0; 0 1 0];
right = [0 0 0; 0 -1 1; 0 0 0];
left = [0 0 0; 1 -1 0; 0 0 0];

% pad image with zeros and convert image
dU_0 = zeros(size(U_0) + 2);
dU_0(2:end - 1, 2:end - 1) = im2double(U_0);

% iterate diffusion for nsteps
for t = 1:nsteps

        nabla_upper = filter2(upper, dU_0);
        nabla_lower = filter2(lower, dU_0);   
        nabla_left = filter2(left, dU_0);
        nabla_right = filter2(right, dU_0); 
        
        % Smoothing function g1
        d_upper = 1./(1 + (nabla_upper/kappa).^2);
        d_lower = 1./(1 + (nabla_lower/kappa).^2);
        d_left = 1./(1 + (nabla_left/kappa).^2);
        d_right = 1./(1 + (nabla_right/kappa).^2);

        % partial differential equation
        dU_0 = dU_0 + dt * (...
               d_upper .* nabla_upper ...
            +  d_lower .* nabla_lower ... 
            +  d_left .* nabla_left ... 
            +  d_right .* nabla_right);
           
end

% reverse image conversion
U = im2uint8(dU_0(2:end - 1, 2:end - 1));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%by Sergej Keller, Lennart Scherz, Pascal Urban