function [B,t] = calcBWThresh(A,method,v)
%CALCBWTHRESH  segments an image into two parts
%
%
%See also graythresh, imbinarize, otsuthresh, adaptthresh.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
B = zeros(size(A));

switch method
    case "manual"
        if nargin > 2
            B(A > v) = 255;
            t = v;
        else
            disp("not Enough Input arguments");
            %throw(MException())
        end
    case "median"
        t = median(A);
        B(A > t) = 255;
       
    case "isodata"

    case "otsu"
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%by Sergej Keller, Lennart Scherz, Pascal Urban
