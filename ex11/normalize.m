function [B]=normalize(A)
%NORMALIZE
%
%   See also rescale.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

min_val = min(A, [], 'all');
max_val = max(A, [], 'all');
B = (A-min_val)/(max_val-min_val);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% by Sergej Keller, Lennart Scherz, Pascal Urban