% Testscript for rotateImg.m

clear all;
test = zeros(1,4);
img_gr = uint8(padarray(100*ones(5,6),[2,2]));
img_rgb = uint8(padarray(100*ones(5,6,3),[2,2]));
img = {img_gr ; img_rgb};
method = {'nearestneighbor';'bilinear'};
no = 1;
%% Test 1-2 (functionality of 'nearestneighbor')
for i = 1:2
    try
        rotIm = double(rotateImg(img{i},pi/4,method{1}));
        solIm = double(imrotate(img{i},45,'nearest','crop'));
        comp = abs(rotIm-solIm);
        
        if i == 1
            test(no) = (norm(comp)<6);
        elseif i == 2
            test(no) = (norm(comp(:,:,1))<6 && norm(comp(:,:,2))<6 && ...
                norm(comp(:,:,3))<6);
        end
        
    catch error
        test(no) = 0;
        fprintf('An error occured in test no. %i.\n',no)
        disp(error)
        
    end
    no = no+1;
end

% End Test 1-2

%% Test 3-4 (functionality of 'bilinear')
for i = 1:2
    try
        rotIm = double(rotateImg(img{i},pi/4,method{2}));
        solIm = double(imrotate(img{i},45,'bilinear','crop'));
        comp = abs(rotIm-solIm);
        
        if i == 1
            test(no) = norm(comp)<6;
        elseif i == 2
            test(no) = (norm(comp(:,:,1))<6 && norm(comp(:,:,2))<6 && ...
                norm(comp(:,:,3))<6);
        end
        
    catch error
        test(no) = 0;
        fprintf('An error occured in test no. %i.\n',no)
        disp(error)
        
    end
    no = no+1;
end
% End Test 3-4

%Sumary
disp('Summary:');
for i=1:length(test)
    if test(i)
        fprintf('Test %i: passed\n',i)
    else
        fprintf('Test %i: failed\n',i)
    end
end
