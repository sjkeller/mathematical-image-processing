%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

image = imread("peppers_gray.png");

detectedImage = im2double(detectEdge(image, 15, 45, 1.0));

figure(1);
imshow(detectedImage);

figure(2);
sol = edge(image, "canny");
imshow(sol);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%by Sergej Keller, Lennart Scherz, Pascal Urban
