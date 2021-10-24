%bilinearSpline.m
%Use bilinear splines to interpolate values of discrete image A
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% YOUR CODE HERE
A = [ 69, 110, 196; ...
      50, 226, 101; ...
      210, 100, 206];


X = 1:.1:3;
Y = 1:.1:3;
Z = spline_func(A,X.',Y);
surf(X,Y,Z);
axis([1, size(A,1), 1, size(A,2), 0, 255]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%by Sergej Keller, Lennart Scherz, Pascal Urban
