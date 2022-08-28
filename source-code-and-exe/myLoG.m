function [outputImg] = myLoG(inputImg)

% m x n: the size of the image
[m,n] = size(inputImg);

% padding image
paddingImg = zeros(m+4,n+4,"uint32");
for i = 1:m
    for j = 1:n
        paddingImg(i+2,j+2) = inputImg(i,j);
    end
end

% preparing result arrays
result = zeros(m,n,"uint32");

% apply approximation 5x5 LoG mask
for i = 1:m
    for j = 1:n
        result(i,j) = 16*paddingImg(i+2,j+2)...
            - paddingImg(i,j+2)...
            - paddingImg(i+1,j+1) - 2*paddingImg(i+1,j+2) - paddingImg(i+1,j+3)...
            - paddingImg(i+2,j) - 2*paddingImg(i+2,j+1) - 2*paddingImg(i+2,j+3) - paddingImg(i+2,j+4)...
            - paddingImg(i+3,j+1) - 2*paddingImg(i+3,j+2) - paddingImg(i+3,j+3)...
            - paddingImg(i+4,j+2);
    end
end

% convert to uint8
outputImg = uint8(result);

end

