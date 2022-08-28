function [outputImg] = mySobel(inputImg)

% m x n: the size of the image
[m,n] = size(inputImg);

% padding image
paddingImg = zeros(m+2,n+2,"uint32");
for i = 1:m
    for j = 1:n
        paddingImg(i+1,j+1) = inputImg(i,j);
    end
end

% preparing result arrays
% sobel result: horizontal
sobel_h = zeros(m,n,"uint32");
% sobel result: vertical
sobel_v = zeros(m,n,"uint32");
% sobel result: 45 degree
sobel_l1 = zeros(m,n,"uint32");
% sobel result: -45 degree
sobel_l2 = zeros(m,n,"uint32");

% calculate Sobel edge detection in four directions respectively
for i = 1:m
    for j = 1:n
        sobel_h(i,j) = paddingImg(i+2,j) + 2*paddingImg(i+2,j+1) + paddingImg(i+2,j+2)...
            - paddingImg(i,j) - 2*paddingImg(i,j+1) - paddingImg(i,j+2);
        sobel_v(i,j) = paddingImg(i,j+2) + 2*paddingImg(i+1,j+2) + paddingImg(i+2,j+2)...
            - paddingImg(i,j) - 2*paddingImg(i+1,j) - paddingImg(i+2,j);
        sobel_l1(i,j) = paddingImg(i,j+1) + 2*paddingImg(i,j+2) + paddingImg(i+1,j+2)...
            - paddingImg(i+1,j) - 2*paddingImg(i+2,j) - paddingImg(i+2,j+1);
        sobel_l2(i,j) = paddingImg(i+1,j+2) + 2*paddingImg(i+2,j+2) + paddingImg(i+2,j+1)...
            - paddingImg(i+1,j) - 2*paddingImg(i,j) - paddingImg(i,j+1);
    end
end

% calculate the average of four directions Sobel as result
outputImg = uint8((sobel_h+sobel_v+sobel_l1+sobel_l2)/4);

end

