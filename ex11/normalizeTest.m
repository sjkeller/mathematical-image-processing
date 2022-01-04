% Testscript for normalize

clear all;
test = [];
no = 0;

%% size test
no = no+1;
try
    A = zeros(3,5,'uint8'); A(2,2) = 5;
    B = normalize(A);
    test(no) = (sum(size(A) ==size(B)) == 2);
catch error
    test(no)=0;
    disp('An error occured.');
    disp(error)
end

%% functionality test 1d 2 values
no = no+1;
try
    A = [1,2];
    A_out = normalize(A);
    A_ref = [0,1];
    test_norm = max(max(abs(double(A_out) - double(A_ref))));
    test(no) = (test_norm <1e-8); 
catch error
    test(no)=0;
    disp('An error occured.');
    disp(error)
end

%% functionality test 1d 3 values equidistant
no = no+1;
try
    A = [-1,0,1];
    A_out = normalize(A);
    A_ref = [0,0.5,1];
    test_norm = max(max(abs(double(A_out) - double(A_ref))));
    test(no) = (test_norm <1e-8); 
catch error
    test(no)=0;
    disp('An error occured.');
    disp(error)
end

%% functionality test 1d 3 values 
no = no+1;
try
    A = [-5,0,1];
    A_out = normalize(A);
    A_ref = [0,5/6,1];
    test_norm = max(max(abs(double(A_out) - double(A_ref))));
    test(no) = (test_norm <1e-8); 
catch error
    test(no)=0;
    disp('An error occured.');
    disp(error)
end

%% functionality test 2d 
no = no+1;
try
    A = [-5,0;1,5];
    A_out = normalize(A);
    A_ref = [0,0.5;0.6,1];
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
