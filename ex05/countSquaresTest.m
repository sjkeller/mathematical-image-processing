% Testscript for countSquares.m
% Requirements: Test images "squares_1.png" and  "squares_2.png"
%               need to reside in the working directory.
clear all;
test = [0,0];
A1 = imread('squares_1.png');
szvec1 = [18,17,16];
A2 = imread('squares_2.png');
szvec2 = [39, 31, 24, 23, 33, 35, 27, 30, 23, 25, 33, 24, 32, 30, 35, 26, 26, 28, 28, 24];


%Test 1 - small image
no=1;
try
    nsquares = countSquares(A1);
    test(no) = (max(abs(nsquares(1:length(szvec1)) - szvec1)) ==0);
catch error
    test(no) = 0;
    fprintf('An error occured in test no. %i.\n',no)
    disp(error)
end

%Test 2 - large image
no=2;
try
    nsquares = countSquares(A2);
    test(no) = (max(abs(nsquares(1:length(szvec2)) - szvec2)) ==0);
catch error
    test(no) = 0;
    fprintf('An error occured in test no. %i.\n',no)
    disp(error)
end

%Summary
disp('Summary:');
for ii=1:length(test)
    if test(ii)
        fprintf('Test %i: passed\n',ii)
    else
        fprintf('Test %i: failed\n',ii)
    end
end
