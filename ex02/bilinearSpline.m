%bilinearSpline.m
%Use bilinear splines to interpolate values of discrete image A
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% image matrix given in c)
A = [ 69, 110, 196; ...
      50, 226, 101; ...
      210, 100, 206];


% generate vectors X and Y
X = 1:.1:3;
Y = 1:.1:3;

% spline function
Z = spline_func(A,X.',Y);

# plot and ...
surf(X,Y,Z);

# ... set axis
axis([1, size(A,1), 1, size(A,2), 0, 255]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%by Sergej Keller, Lennart Scherz, Pascal Urban
