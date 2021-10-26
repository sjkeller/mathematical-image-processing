function [B] = rotateImg(A,phi,method)
%ROTATEIMG Rotate image.
%
%
%See also imrotate.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % preallocate B
    B = zeros(size(A));
    
    % get size of padded image
    [m,n,d] = size(A);
    
    % calculate rot. mat
    D = [cos(phi), -sin(phi); sin(phi), cos(phi)];
    D_inv = D.';
    
    % calculate center point of original image
    mid_point = [m/2+0.5, n/2+0.5];
    
    % assign rotated image coordinates
    coord_rot = [repelem(1:m,n).', repmat((1:n).',m,1)];
    
    % calculate original coordinates
    coord_o = (D_inv*(coord_rot - mid_point).').' + mid_point;
    
    % check for coordinates out of bounds
    oob_idx = find(sum((coord_o >= [m+0.5, n+0.5]) + (coord_o < [0.5, 0.5]),2));    % out of bound indices
    
    % delete out of bound coordiantes
    coord_rot(oob_idx,:) = [];
    coord_o(oob_idx,:) = [];
    
    
    % method switch
    switch(lower(method))
        
        case'nearestneighbor'
            % round to nearest neighbour
            coord_o = round(coord_o);

            % set original pixel values in rotated picture
            for jj = 1:size(coord_rot,1)
                B(coord_rot(jj,1),coord_rot(jj,2),1:d) = A(coord_o(jj,1),coord_o(jj,2),1:d);
            end
            
        case 'bilinear'
            
            % define bilinear function
            b = @(x,y,i,j) max((1 - abs(x-i))*(1 - abs(y-j)), 0);
            
            % loop over rotated pixel coordinate vector
            for jj = 1:size(coord_rot,1)
                
                % get neighbor coordinates
                x_ = coord_o(jj,1);
                y_ = coord_o(jj,2);
                x_lo = floor(coord_o(jj,1));
                x_hi = ceil(coord_o(jj,1));
                y_lo = floor(coord_o(jj,2));
                y_hi = ceil(coord_o(jj,2));
                
                % get pixel values of neighbors (try catch for edge cases)
                try
                    p1 = A(x_lo, y_lo, 1:d);
                catch
                    p1 = 0;    
                end
                try
                    p2 = A(x_hi, y_lo, 1:d);
                catch
                    p2 = 0;
                end
                try
                    p3 = A(x_hi, y_hi, 1:d);
                catch
                    p3 = 0;
                end
                try
                    p4 = A(x_lo, y_hi, 1:d);
                catch
                    p4 = 0;
                end
                
                % calculate bilinear value
                value = p1 * b(x_, y_, x_lo, y_lo) + ...
                        p2 * b(x_, y_, x_hi, y_lo) + ...
                        p3 * b(x_, y_, x_hi, y_hi) + ...
                        p4 * b(x_, y_, x_lo, y_hi);
                    
                % assign value in B
                B(coord_rot(jj,1),coord_rot(jj,2),1:d) = value;
            end
            
    end
    
    % set variable type to int (compatibility)
    B = uint8(B);
    

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% by Sergej Keller, Lennart Scherz, Pascal Urban
