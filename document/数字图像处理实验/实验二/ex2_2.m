f = imread('D:\Matlab\document\����ͼ����ʵ��\ex2\2_2.jpg');
h=histeq(f, 256);
figure, imshow(f);
figure, imhist(f);
figure, imshow(h);
figure, imhist(h);