function [V] = imageDilate(U,B)
%imageDilate Perform morphological dilation.
%
%
%See also imdilate, imerode, imopen, imclose.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

V = zeros(size(U));
mid_x = 0.5 * size(B,1) + 0.5;
disp(mid_x)
mid_y = 0.5 * size(B,2) + 0.5;
disp(mid_y)

m = size(U,1);
n = size(U,2);

k = unique(U, 'sorted');

% iterate thorugh whole image U
for t=1:size(k)
    for x=1:m
        for y=1:n
    
            % check if pixel ref 
            if U(x,y) == k(t)
    
                % iterate around structure element B area inside image U
                for i=1:size(B,1)
                    for j=1:size(B,2)
                        if B(i,j) == 1
                            % if indices are not out of bound apply grayscale color
                            if x-mid_x+i > 0 && y-mid_y+j > 0 && x-mid_x+i <= m && y-mid_y+j <= n 
                                V(x-mid_x+i, y-mid_y+j) = U(x,y);
                            end
                        end
                    end
                end
    
            end
    
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%by Sergej Keller, Lennart Scherz, Pascal Urban
