% Testscript for calcBWThresh.m
% Requirements: Test image "noisy_fingerprint.png"
%               needs to reside in the working directory.

A = imread('noisy_fingerprint.png');
img_rgb = reshape(ones(1,3),1,1,3);
test_img = [10 10 10;11 11 11];
test_res = [0 0 0;255 255 255];
test = [0 0 0 0 0 0];
method = {'manual';'median';'isodata';'otsu'};
no = 1;

%% Test if function handles RGB images correctly
try
    [img,~] = calcBWThresh(A,method{1},10);
    
    
    test(no) = (size(img,3)==1);
    
    
catch error
    test(no) = 0;
    fprintf('An error occured in test no. %i.\n',no)
    disp(error)
end
no = no+1;

%% Test if threshold is correct 'manual'
try
    [~,t] = calcBWThresh(A,method{1},10);
    test(no) = (t == 10);
catch error
    test(no) = 0;
    fprintf('An error occured in test no. %i.\n',no)
    disp(error)
end
no = no+1;
%% Test if output image is correct 'manual'
try
    [img,~] = calcBWThresh(test_img,method{1},10);
    comp = abs(double(img)-test_res);
    
    
    test(no) = (norm(comp)<1e-8);
    
catch error
    test(no) = 0;
    fprintf('An error occured in test no. %i.\n',no)
    disp(error)
end
no = no+1;
%% Test if threshold is correct 'median'
try
    [~,t] = calcBWThresh(A,method{2},10);
    
    test(no) = (t == 179);
    
catch error
    test(no) = 0;
    fprintf('An error occured in test no. %i.\n',no)
    disp(error)
end
no = no+1;
%% Test if threshold is correct 'isodata'
try
    [~,t] = calcBWThresh(A,method{3},10);
    
    test(no) = (t == 125);
    
catch error
    test(no) = 0;
    fprintf('An error occured in test no. %i.\n',no)
    disp(error)
end
no = no+1;

%% Test if threshold is correct 'otsu'
try
    [~,t] = calcBWThresh(A,method{4},10);
    
    test(no) = (t == 126);
    
catch error
    test(no) = 0;
    fprintf('An error occured in test no. %i.\n',no)
    disp(error)
end
% End tests

disp('Summary:');
for i=1:length(test)
    if test(i)
        fprintf('Test %i: passed\n',i)
    else
        fprintf('Test %i: failed\n',i)
    end
end