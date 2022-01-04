% Testscript for inpaintRect
% Requirements: 
% - Octave: Image package - 'pkg load image'
% - MATLAB: Image processing toolbox

clc; clear all;
A = zeros(8,'uint8'); A(1,1) = 255;
no=1;
test = [];

%% Test1 datatype
try
    B = inpaintRect(A,[2, 3, 2, 3],1,1);
    test(no) = isa(B,class(A));
catch error
    test(no)=0;
    disp('An error occured.');
    disp(error)
end
no = no+1;

%test2 applyLp value filter size
try
    B = inpaintRect(A,[2, 3, 2, 3],1,1);
    test(no) = (sum(sum(B(2:3,2:3)))==85);
catch error
    test(no)=0;
    disp('An error occured.');
    disp(error)
end
no = no+1;

%Summary
disp('Summary:');
for i=1:length(test)
    if test(i)
        fprintf('Test %i: passed\n',i)
    else
        fprintf('Test %i: failed\n',i)
    end
end
