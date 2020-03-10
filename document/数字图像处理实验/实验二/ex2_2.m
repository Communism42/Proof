f = imread('D:\Matlab\document\数字图像处理实验\ex2\2_2.jpg');
h=histeq(f, 256);
figure, imshow(f);
figure, imhist(f);
figure, imshow(h);
figure, imhist(h);