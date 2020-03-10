I=imread('cameraman.tif');
J=uint8(filter2(fspecial('gaussian'),I));
K=imsubtract(I,J);
subplot(221);imshow(I);title('原图');
subplot(222);imshow(J);title('生成的背景亮度图像');
subplot(223);imshow(K,[]);title('相减之后的图像');