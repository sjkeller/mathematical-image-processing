function [z] = compConvolution(x,y,mode)

%COMPCONVOLUTION Caclulate convolution of two vectors
%
%
%See also conv, cconv, xcorr, conv2, filter, imfilter.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if(size(x, 2) == 1)
    x = x.';
end

if(size(y, 2) == 1)
    y = y.';
end

n_x = numel(x);
n_y = numel(y);


    switch(mode)
        case 'zero' 
            n = n_x + n_y-1;
            z = zeros(1, n);
            for ii = 1:n
                x_temp = [zeros(1, n_y-1), x, zeros(1, n_y-1)];
                y_temp = zeros(1, 2*(n_y-1) +n_x);
                y_temp(ii:ii+n_y-1) = y(n_y:-1:1);
                z(ii) = x_temp*y_temp.';
            end
        
        case 'circular'
            n = n_x;
            z = zeros(1, n);
            for ii = 1:n
                y_temp = [y(ii+1:end), y(1:ii)];
                y_temp = y_temp(end: -1:1);
                z(ii) = x*y_temp.';
            end
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% by Sergej Keller, Lennart Scherz, Pascal Urban
