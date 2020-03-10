clear all;
close all;
I = imread('C:\Users\admin\Desktop\test\4.png');
s1=std2(I);
J=histeq(I);
figure;imshow(uint8(J),[]);title('均衡化之后的图像');
imwrite(uint8(J), 'C:\Users\admin\Desktop\test\6.png'); % 保存图片
s2=std2(J);