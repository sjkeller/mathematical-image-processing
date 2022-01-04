% Testscript for laplaceSharpening
% only basic tests implemented
% Requirements: needs the script normalize to reside in the working directory

clear all;
test = [];
no = 0;

%% size test
no = no+1;
try
    A = zeros(3,5,'uint8'); A(2,2) = 5;
    B = laplaceSharpening(A,0.1);
    test(no) = (sum(size(A) ==size(B)) == 2);
catch error
    test(no)=0;
    disp('An error occured.');
    disp(error)
end

%% type test
no = no+1;
try
    A = zeros(3,5,'uint8'); A(2,2) = 5;
    B = laplaceSharpening(A,0.1);
    test(no) = isa(B,'uint8');
catch error
    test(no)=0;
    disp('An error occured.');
    disp(error)
end

%% range test
no = no+1;
try
%not implemented
catch error
    test(no)=0;
    disp('An error occured.');
    disp(error)
end

%% functionality test laplacian
no = no+1;
try
% not implemented
catch error
    test(no)=0;
    disp('An error occured.');
    disp(error)
end

%% functionality test image 
no = no+1;
try
%not implemented
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
