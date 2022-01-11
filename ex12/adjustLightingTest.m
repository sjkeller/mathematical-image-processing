% Testscript for adjustLighting

test_im = uint8([125 125;125 250]);
test_p = [0.0817;0.2451;0.0408];

test = [];
no = 1;
%% datatype test
try
    [B,~] = adjustLighting(test_im);
    test(no) = isa(B,'uint8');
catch error
    test(no)=0;
    disp('An error occured.');
    disp(error)
end
no = no+1;

%% functionality test

% test parameters
try
    [~,p] = adjustLighting(test_im);
    test_norm = norm(p-test_p);    
    test(no) = (test_norm <1e-4); 
catch error
    test(no)=0;
    disp('An error occured.');
    disp(error)
end
no = no+1;

% test image
try
    [C,~] = adjustLighting(test_im);
    
    test(no) = (max(C(:))==255 && min(C(:))==0); 
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
