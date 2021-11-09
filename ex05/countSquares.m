function nsquares = countSquares(A)
%countScquares Count squares in a binary image
%
%See also .
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[m,n] = size(A);
N_max = max(m,n);

% Pad image
A = [zeros(N_max/2,N_max + n); ...
    zeros(m,N_max/2), -(A-1), zeros(m,N_max/2); ...
    zeros(N_max/2,N_max + n)];

% Preallocation
nsquares = zeros(1,N_max);

% Loop über mögliche Quadratgrößen
for N = N_max:-1:1

    % Erosionssttructure definineren
    se = uint8(ones(N));

    % Erodieren dann dilatieren
    A_temp = imdilate(imerode(A,se), se);

    % Zählen
    nsquares(N) = sum(double(A_temp),'all')/N^2;

    % Abziehen von gezählten Pixeln
    A = A - A_temp;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% by NAME
