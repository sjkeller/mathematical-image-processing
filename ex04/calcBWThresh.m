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
                t = v;
            else
                disp("not Enough Input arguments");
                %throw(MException())
                t = mean(A(:));
            end
        case "median"
            t = median(A(:));
        case "isodata"
            t = round(fzero(@(t_) isoData_func(t_,A), mean(A(:))));
        case "otsu"
            A_double = double(A);
            y_vals = zeros(255,1);
            for ii = 1:255
                idx_b = find(A <= ii);
                idx_w = find(A > ii);

                var_b = var(A_double(idx_b));
                if isnan(var_b)
                    var_b = 0;
                end
                var_w = var(A_double(idx_w));
                if isnan(var_w)
                    var_w = 0;
                end
                y_vals(ii) = var_b + var_w;

            end
            [~,t] = min(y_vals, [], 'all');
    end
    
    B(A > t) = 255;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%by Sergej Keller, Lennart Scherz, Pascal Urban
