clc;
clear
f1=imread('555.jpg'); %����ͼ��
figure,imshow(f1),title('ͼһ');
f2=imread('666.jpg '); %����ͼ��
figure,imshow(f2),title('ͼ��');
f3=imadd(f1,f2);
figure,imshow(f3),title("ͼһ + ͼ��");
imwrite(uint8(f3), '7.jpg');