% Testskript for grayscaleImg.m
% Requirements: Test image "mandril_color.png" needs to reside in the working directory.
clear all

test = zeros(1,15);
A = imread('mandril_color.png');
sz = size(A);
method = {'average';'luma';'digicam'};
no = 0;
test = 0;
%% Test datatype
for i = 1:length(method)
    no = no + 1; test(no) = 0;
    try
        grIm = grayscaleImg(A,method{i});
        
        test(no) = isa(grIm,class(A));
        
    catch error
        test(no) = 0;
        fprintf('An error occured in test no. %i.\n',no)
        disp(error)
    end
end

% End Test datatype
%% Test size
for i = 1:length(method)
    no = no + 1; test(no) = 0;
    try
        grIm = grayscaleImg(A,method{i});
        
        test(no) = (min(size(grIm) == sz(1:2)));
        
    catch error
        test(no) = 0;
        fprintf('An error occured in test no. %i.\n Wrong dimensions \n',no)
        disp(error)
    end
end
% End Test size

%% Test functionality
p = [0,100,150];
p = reshape(p,1,1,3);

%% Test method average
no = no+1; test(no) = 0;
try
    grIm = grayscaleImg(p,'average');
    
    test(no) = (grIm == 83);
    
catch error
    test(no) = 0;
    fprintf('An error occured in test no. %i \n',no);
    disp(error)
end
% End Test average

%% Test method luma
no = no+1; test(no) = 0;
try
    grIm = grayscaleImg(p,'luma');
    
    test(no) = (grIm == 82);
    
catch error
    test(no) = 0; 
    fprintf('An error occured in test no. %i \n',no);
    disp(error)
end
% End Test luma

%% Test method digicam
no = no+1; test(no) = 0;
try
    grIm = grayscaleImg(p,'digicam');
    
    test(no)= (grIm == 100);
    
catch error
    test(no) = 0;
    fprintf('An error occured in test no. %i \n',no);
    disp(error)
end
% End Test digicam

disp('Summary:');
for i=1:no
    if test(i)
        fprintf('Test %i: passed\n',i)
    else
        fprintf('Test %i: failed\n',i)
    end
end
