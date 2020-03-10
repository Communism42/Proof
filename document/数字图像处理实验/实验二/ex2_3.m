clc;
clear
f1=imread('555.jpg'); %读入图像
figure,imshow(f1),title('图一');
f2=imread('666.jpg '); %读入图像
figure,imshow(f2),title('图二');
f3=imadd(f1,f2);
figure,imshow(f3),title("图一 + 图二");
imwrite(uint8(f3), '7.jpg');