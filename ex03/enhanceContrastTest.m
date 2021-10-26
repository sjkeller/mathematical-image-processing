% Testscript for enhanceContrast.m


test = zeros(1,2);
perm = eye(60);
perm = perm(randperm(60),:);
% gernerating permuted histogram
hist = perm*[20*ones(4,1); 40*ones(6,1); 99*ones(10,1); 100*ones(20,1);...
    101*ones(15,1); 102*ones(5,1)];
hist_Stretch = perm*[0*ones(4,1); 62*ones(6,1); 246*ones(10,1); 249*ones(20,1);...
    252*ones(15,1); 255*ones(5,1)];
hist_Eq = perm*[17*ones(4,1); 43*ones(6,1); 85*ones(10,1); 170*ones(20,1);...
    234*ones(15,1); 255*ones(5,1)];

method = {'contrastStretching';'histEqualization'};
test = [0 0];
no = 1;

%% Test 1 (functionality of 'contrastStretching' for a grayscale image)

try
    enh_img = double(enhanceContrast(hist,method{1}));
    comp = abs(enh_img-hist_Stretch);
    
    test(no) = (norm(comp)<sqrt(60) && max(enh_img) == 255 && ...
        min(enh_img) == 0);
    
catch error
    test(no) = 0;
    fprintf('An error occured in test no. %i.\n',no)
    disp(error)
    
end
no = no+1;
% End Test 1

%% Test 2 (functionality of 'histEqualization' for a grayscale image)
try
    enh_img = double(enhanceContrast(hist,method{2}));
    comp = abs(enh_img-hist_Eq);
    
    test(no) = (norm(comp)<sqrt(60) && max(enh_img) == 255);
    
catch error
    test(no) = 0;
    fprintf('An error occured in test no. %i.\n',no)
    disp(error)
    
end
% End Test 2

disp('Summary:');
for i=1:length(test)
    if test(i)
        fprintf('Test %i: passed\n',i)
    else
        fprintf('Test %i: failed\n',i)
    end
end