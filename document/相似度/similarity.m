%%% ͼ�����ƶȲ���
clc;clear;close all;
%set(gcf,'outerposition',get(0,'screensize'));
imag1 = 'C:\Users\admin\Desktop\test\2.png';
imag2 = 'C:\Users\admin\Desktop\test\4.png';
[count1,I1] = GetRgbHist(imag1);
[count2,I2] = GetRgbHist(imag2);
value = imsimilar(count1,count2,2);
subplot(2,2,1);imshow(I1);title('ԭͼ');
subplot(2,2,2);hold on;imshow(I2);title('�ϲ����ͼ��');
subplot(2,1,2);
plot(count1);
hold on;
plot(count2,'r');
%title('Original Image','Image scale of 80%', 2);
str = sprintf('Similarity:%s %%',num2str(value));
title(str);
