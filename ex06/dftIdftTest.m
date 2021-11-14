% Testscript for dft.m and idft.m

clear all;
eps = 10e-8;
x = [1,0,-1,0];
test = [];
no=1;

%test dft imaginary part
try    
    test(no) = (norm(imag(dft(x))) < eps);
    
catch error
    test(no) = 0;
    fprintf('An error occured in test no. %i.\n',no)
    disp(error)
end
no = no+1;

%test dft real part
try    
    test(no) = (norm(real(dft([0,1,0,-1]))) < eps);
    
catch error
    test(no) = 0;
    fprintf('An error occured in test no. %i.\n',no)
    disp(error)
end
no = no+1;

%test dft fft
try    
    test(no) = (norm(dft(x) - fft(x)) < eps);
    
catch error
    test(no) = 0;
    fprintf('An error occured in test no. %i.\n',no)
    disp(error)
end
no = no+1;

%test dft (unitary)
try    
    test(no) = (norm(dft(dft(x)) - length(x)*x) < eps);
    
catch error
    test(no) = 0;
    fprintf('An error occured in test no. %i.\n',no)
    disp(error)
end
no = no+1;

%test idft
try    
    test(no) = (norm(idft(x) - ifft(x)) < eps);
    
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
