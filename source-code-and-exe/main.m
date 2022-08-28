%% image1.jpg
[im,map,alpha] = imread("HW4_test_image\image1.jpg","jpg");

SobelResult = mySobel(im);
LoGResult = myLoG(im);

% show result
figure(Name='image1.jpg');
subplot(1,3,1), imshow(im), title('original');
subplot(1,3,2), imshow(SobelResult), title('Sobel');
subplot(1,3,3), imshow(LoGResult), title('LoG');

clear;


%% image2.jpg
[im,map,alpha] = imread("HW4_test_image\image2.jpg","jpg");

SobelResult = mySobel(im);
LoGResult = myLoG(im);

% show result
figure(Name='image2.jpg');
subplot(1,3,1), imshow(im), title('original');
subplot(1,3,2), imshow(SobelResult), title('Sobel');
subplot(1,3,3), imshow(LoGResult), title('LoG');

clear;


%% image3.jpg
[im,map,alpha] = imread("HW4_test_image\image3.jpg","jpg");

SobelResult = mySobel(im);
LoGResult = myLoG(im);

% show result
figure(Name='image3.jpg');
subplot(1,3,1), imshow(im), title('original');
subplot(1,3,2), imshow(SobelResult), title('Sobel');
subplot(1,3,3), imshow(LoGResult), title('LoG');

clear;

