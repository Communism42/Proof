clear all;
close all;
I = imread('C:\Users\admin\Desktop\test\4.png');
s1=std2(I);
J=histeq(I);
figure;imshow(uint8(J),[]);title('���⻯֮���ͼ��');
imwrite(uint8(J), 'C:\Users\admin\Desktop\test\6.png'); % ����ͼƬ
s2=std2(J);