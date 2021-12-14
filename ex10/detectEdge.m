function [B] = detectEdge(A, low, high, sigma)
%
% See also edge.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tmp = zeros(size(A) + 2);
tmp(2:end - 1, 2:end - 1) = A;
tmp(2:end - 1, 1) = A(1:end, 1);
tmp(1, 2:end - 1) = A(1, 1:end);
tmp(2:end - 1, end) = A(1:end, end);
tmp(end, 2:end - 1) = A(1, 1:end);

% step 1
tmp = imgaussfilt(tmp, sigma);

% step 2
KGx = [-1 0 1; -1 0 1; -1 0 1];
KGy = -1 * KGx';

Gx = filter2(KGx, tmp);
Gy = filter2(KGy, tmp);

G = abs(Gx) + abs(Gy); %(Gx.^2 + Gy.^2).^(.5);

theta = atan(abs(Gy)/abs(Gx));

% step 3

% round theta by 45 degree
theta = round(4*theta/pi);
theta(isnan(theta)) = 2;

edgeMap = false(size(theta));

for x=2:1:(size(theta, 1)-1)
    for y=2:1:(size(theta, 2)-1)
        switch theta(x, y)
            case {1}
                predecessor = G(x+1, y+1);
                successor   = G(x-1, y-1);
            case {0}
                predecessor = G(x, y-1);
                successor   = G(x, y+1);
            case {-1}
                predecessor = G(x+1, y+1);
                successor   = G(x+1, y-1);
            case {2, -2} 
                predecessor = G(x-1, y);
                successor   = G(x+1, y);
            otherwise
                disp("ERROR");
        end
        if G(x, y) >= predecessor && G(x,y) >= successor
           edgeMap(x, y) = true;
        end
    end
end

% step 4
G = edgeMap .* G;

G(G <= low) = 0;
G = 0.5 * G;
G(G > high) = 2 * G(G > high);

weakEdges = (G > low) .* (G <= high);
strongEdges = (G > high);

% step 5
mask = ones(3);
mask(2, 2) = 0;

for i=1:1000
    strongOld = strongEdges;
    strongEdges = strongEdges + (filter2(mask, strongEdges) > 0) .* weakEdges; 
    if (strongOld - strongEdges) == 0
        disp("finished");
        break
    end
end

B = (strongEdges(2:end - 1, 2:end - 1));

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%by Sergej Keller, Lennart Scherz, Pascal Urban
