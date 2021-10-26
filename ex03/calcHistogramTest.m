% Testscript for calcHistogram.m
% Requirements: Test image "mandril_color.png" needs to reside in the working directory.
clear all

test = zeros(1,2);
A = imread('mandril_color.png');

[Rhist,~] = imhist(A(:,:,1));
[Ghist,~] = imhist(A(:,:,2));
[Bhist,~] = imhist(A(:,:,3));


%% Test if histogram for rgb image is correct
try
    Hrgb = calcHistogram(A);
    
    RGBtest = [Rhist,Ghist,Bhist]-Hrgb';
    
    test(1) = (sum(sum(RGBtest)) == 0);
    
    
catch error
    test(1) = 0;
    disp('An error occured in second test.');
    disp(error)
end
% End Test 1

%% Test if histogram for grayscale image is correct
try
    Hgr = calcHistogram(A(:,:,1));
    Grtest = Rhist - Hgr';
    
    test(2) = (sum(Grtest) == 0) ;
    
catch error
    test(2) = 0;
    disp('An error occured in third test.');
    disp(error)
end
% End Test 2

%Summary
% avgSc = sum(test)/size(test,2);
% fprintf('Your average testscore was: %.2f %% successfull\n',avgSc*100)

disp('Summary:');
for i=1:length(test)
    if test(i)
        fprintf('Test %i: passed\n',i)
    else
        fprintf('Test %i: failed\n',i)
    end
end
