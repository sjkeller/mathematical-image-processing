% Testscript for peronaMalikStep

test_im = zeros(10,'uint8');
%in = 5*im2uint8(normpdf(1:5,3,3)); %requires statistics package to work
in = [135  160  170  160  135];
test_im(2:6,2) = in(1:5)';
test_im(8,3:7) = in(1:5);
in_sol = [136 161 162 161 136];
test_sol =zeros(10,'uint8');
test_sol(2:6,2) = in_sol(1:5)';
test_sol(8,3:7) = in_sol(1:5);

test = [];
no = 1;
%% datatype test
try
    B = peronaMalikSteps(test_im,0.005,1,0.1);
    test(no) = isa(B,'uint8');
catch error
    test(no)=0;
    disp('An error occured.');
    disp(error)
end
no = no+1;

%% functionality test
try
    test_im = peronaMalikSteps(test_im,0.005,300,0.1);
    
    test_norm = norm(double(test_im)-double(test_sol));
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
