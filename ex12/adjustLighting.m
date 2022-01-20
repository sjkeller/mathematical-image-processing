function [B, par] = adjustLighting(A)
%ADJUSTLIGHTING
%
% See also.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f = im2double(A);
[m,n]=size(f);

linSys = [(repelem(1:m,1,n).').^2, repmat((1:n).',m,1), ones(m*n,1)];
z = f(:);

par = linSys\z;
B = f - reshape(linSys*par,m,n);

B = B./max(B,[],'all');

B = im2uint8(B);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% by Sergej Keller, Lennart Scherz, Pascal Urban
