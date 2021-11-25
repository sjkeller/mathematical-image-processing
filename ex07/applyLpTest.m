% Testscript for applyLp
% Requirements: 
% - Octave: Image package - 'pkg load image'
% - MATLAB: Image processing toolbox
% - The test image 'plain_pnoise.png' needs to reside in the working directory

clc; clear all;
A = zeros(8,'uint8'); A(1,1) = 255;
S = imread('plain_pnoise.png');
no=1;
test = [];

%% Test1 datatype
try
    B = applyLp(A,2);
    test(no) = isa(B,class(A));
catch error
    test(no)=0;
    disp('An error occured.');
    disp(error)
end
no = no+1;

%test2 applyLp value filter size
try
    B = applyLp(A,2);
    test(no) = (sum(B(:))==504);
catch error
    test(no)=0;
    disp('An error occured.');
    disp(error)
end
no = no+1;

%test3 pnoise
try
    B = applyLp(S,9);
    test(no) = (norm(im2double(B) - im2double(S)) < 0.01);
catch error
    test(no)=0;
    disp('An error occured.');
    disp(error)
end
no = no+1;

%test4 pnoise
try
    B = applyLp(S,6);
    test(no) = (median(B(:) == 127));
catch error
    test(no)=0;
    disp('An error occured.');
    disp(error)
end

%Summary
disp('Summary:');
for i=1:length(test)
    if test(i)
        fprintf('Test %i: passed\n',i)
    else
        fprintf('Test %i: failed\n',i)
    end
end
