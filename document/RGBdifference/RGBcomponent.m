clc;
clear;
%读入原图像及获取大小
image = imread('D:\Matlab\document\merge1\1.png');
[M, N, Z] = size(image);
%   分别读取RGB
image_r=image(:,:,1);
image_g=image(:,:,2);
image_b=image(:,:,3);

%  测试RGB输出
subplot(2,2,1),imshow(image_r),title('Red component');  
subplot(2,2,2),imshow(image_g),title('green component');  
subplot(2,2,3),imshow(image_g),title('blue component');  
subplot(2,2,4),imshow(image),title('original image');  