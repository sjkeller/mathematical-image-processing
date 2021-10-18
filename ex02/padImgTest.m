% Testscript for padImg.m

test = zeros(1,4);
img_gr = uint8(randi([0,255],[161,240]));
img_rgb = uint8(randi([0,255],[161,240,3]));
img = {img_gr ; img_rgb};
no = 1;
%% Test 1&2 (tests if numbers of zeros p is correct)
for i = 1:2
    
    try
        [~,p] = padImg(img{i});
        
        test(no) = (p == 64);
        
    catch error
        test(no) = 0;
        fprintf('An error occured in test no. %i.\n',no)
        disp(error)
    end
    no = no+1;
end
% End Test 1&2

%% Test 3&4 (tests if image is at the correct place)
for i = 1:2
    
    try
        Ap = padImg(img{i});
        
        test(no) = (min(Ap(64+1,64+1,:) == img{i}(1,1,:)) && min(Ap(64+161,64+240,:) == img{i}(161,240,:)));
        
    catch error
        test(no+2) = 0;
        fprintf('An error occured in test no. %i.\n',no)
        disp(error)
    end
    no = no+1;
end

% End Test 3&4

%Summary
disp('Summary:');
for i=1:length(test)
    if test(i)
        fprintf('Test %i: passed\n',i)
    else
        fprintf('Test %i: failed\n',i)
    end
end