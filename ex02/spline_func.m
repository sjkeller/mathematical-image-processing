function [Z] = spline_func(A,X,Y)

% spline function
B = @(x) max(zeros(size(x)), 1 - abs(x));

% build zero vector
Z = zeros(size(X));

for i=1:size(A,1)
    for j=1:size(A,2)
        Z = Z + A(i, j) .* (B(X - i) * B(Y - j));
    end
end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%by Sergej Keller, Lennart Scherz, Pascal Urban
