% Testscript for compConvolution.m
% Requirements: Test 5 (optional) needs routine cconv found in
% - 'signal' package (Octave), 
% - 'signal processing toolbox' MATLAB

clear all;
x = 1:10;
test = [];
no=1;

%test unit element
try    
    test(no) = (min(compConvolution(x,1,'zero') == x) == 1);

catch error
    test(no) = 0;
    fprintf('An error occured in test no. %i.\n',no)
    disp(error)
end
no = no+1;

%test symmetry
try    
    test(no) = (min(compConvolution(1,x,'zero') == x) == 1);
    
catch error
    test(no) = 0;
    fprintf('An error occured in test no. %i.\n',no)
    disp(error)
end
no = no+1;

%test convolution
try    
    test(no) = (min(compConvolution([1,1,1],x,'zero') == conv([1,1,1],x)) == 1);
    
catch error
    test(no) = 0;
    fprintf('An error occured in test no. %i.\n',no)
    disp(error)
end
no = no+1;

%test circular
try    
    test(no) = (min(compConvolution([1,1,0,0,1],1:5,'circular') == [8, 6, 9, 12, 10]) == 1);
    
catch error
    test(no) = 0;
    fprintf('An error occured in test no. %i.\n',no)
    disp(error)
end
no = no+1;

%test circular symmetry
try    
    test(no) = (min(compConvolution(1:5,[1,1,0,0,1],'circular') == [8, 6, 9, 12, 10]) == 1);
    
catch error
    test(no) = 0;
    fprintf('An error occured in test no. %i.\n',no)
    disp(error)
end
no = no+1;

%%test circular with cconv (optional test, requires signal package or signal processing toolbox)
ncconv = no;
try    
    test(no) = ...
    (min(compConvolution([1,1,0,0,1],1:5,'circular') ...
      == cconv(1:5,[1,1,0,0,1],5) == 1));
    
catch error
    test(no) = 0;
    fprintf('An error occured in test no. %i.\n',no)
    disp(error)
end
% End tests

%Summary
disp('Summary:');
for i=1:length(test)
    if test(i)
        fprintf('Test %i: passed\n',i)
    else
        fprintf('Test %i: failed\n',i)
    end
end
fprintf('Note: Test %i is optional and requires the signal package/signal processing toolbox.\n',ncconv)
