function [Z] = spline_func(A,X,Y)

B = @(x) max(zeros(size(x)), 1 - abs(x));

Z = zeros(size(X));

for i=1:size(A,1)
    for j=1:size(A,2)
        %Z = Z + A(i, j) .* b_spline(X - i, Y - j);
        Z = Z + A(i, j) .* (B(X - i) * B(Y - j));
    end
end

end



