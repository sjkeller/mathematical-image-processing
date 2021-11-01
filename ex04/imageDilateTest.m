% Testscript for imageDilate.m
% Requirements: 
% - Octave: Image package - 'pkg load image'
% - MATLAB: Image processing toolbox

% Prepare input and reference
% input image
U = [0, 0, 0, 0;...
     0, 127, 255, 0;...
     0, 1, 0, 0];

% input structure element
B = [0, 0, 0;...
     1, 1, 0;...
     0, 1, 0];

%reference output
V = [0, 0, 0, 0;...
     127, 255, 255, 0;...
     1, 127, 255, 0];

no = 1;
%% Test if function returns image in correct size
try
    [m,n] = size(imageDilate(U,B));
    test(no) = (m == size(U,1) && n == size(U,2));
    
catch error
    test(no) = 0;
    fprintf('An error occured in test no. %i.\n',no)
    disp(error)
end
no = no+1;

%% Test if function returns correct output for binary input
try
    Ubw = U > 0; Vbw = V > 0;
    VVbw = imageDilate(Ubw,B);
    test(no) = (sum(sum(VVbw ~= Vbw)) == 0);
    
catch error
    test(no) = 0;
    fprintf('An error occured in test no. %i.\n',no)
    disp(error)
end
no = no+1;

%% Test if function returns correct output for grayscale input
try
    VV = imageDilate(U,B);
    test(no) = (sum(sum(VV != V)) == 0);
    
catch error
    test(no) = 0;
    fprintf('An error occured in test no. %i.\n',no)
    disp(error)
end
no = no+1;

%% Test with Octave imdilate function output
try
    VV = imageDilate(U,B);
    test(no) = (sum(sum(imdilate(U,B) ~= V)) == 0);
    
catch error
    test(no) = 0;
    fprintf('An error occured in test no. %i.\n',no)
    disp(error)
end
no = no+1;

% End tests

disp('Summary:');
for i=1:length(test)
    if test(i)
        fprintf('Test %i: passed\n',i)
    else
        fprintf('Test %i: failed\n',i)
    end
end

