% Testscript for heatEquationStep

clear all;
test = [];
no = 1;

%% datatype test
try
    A = zeros(5,'uint8');
    B = heatEquationStep(A,1);
    test(no) = isa(B,'uint8');
catch error
    test(no)=0;
    disp('An error occured.');
    disp(error)
end

%% size test
no = no+1;
try
    A = zeros(3,5,'uint8');
    B = heatEquationStep(A,1);
    test(no) = (sum(size(A) ==size(B)) == 2);
catch error
    test(no)=0;
    disp('An error occured.');
    disp(error)
end

%% functionality test (without boundary)
no = no+1;
try
    A = zeros(5,'uint8'); A(3,3) = 255;
    A_ref = [0    0    0    0    0;...
             0    0  255    0    0;...
             0  255    0  255    0;...
             0    0  255    0    0;...
             0    0    0    0    0];
    A_out = heatEquationStep(A,1);
    test_norm = max(max(abs(double(A_out) - double(A_ref))));
    test(no) = (test_norm <1e-8); 
catch error
    test(no)=0;
    disp('An error occured.');
    disp(error)
end

%% functionality test (without boundary)
no = no+1;
try
    A = zeros(5,'uint8'); A(3,3) = 255;
    A_ref = [0    0   0    0    0;...
             0    0  51    0    0;...
             0   51  51   51    0;...
             0    0  51    0    0;...
             0    0   0    0    0];
    A_out = heatEquationStep(A,0.2);
    test_norm = max(max(abs(double(A_out) - double(A_ref))));
    test(no) = (test_norm <1e-8); 
catch error
    test(no)=0;
    disp('An error occured.');
    disp(error)
end

%% functionality test (with boundary)
no = no+1;
try
    A = zeros(5,3,'uint8'); A(2:4,5) = [100;10;100];
    A_ref = [0    0    0    0  100;...
             0    0    0  100    0;...
             0    0    0   10  180;...
             0    0    0  100    0;...
             0    0    0    0  100];
    A_out = heatEquationStep(A,1);
    test_norm = max(max(abs(double(A_out) - double(A_ref))));
    test(no) = (test_norm <1e-8); 
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

