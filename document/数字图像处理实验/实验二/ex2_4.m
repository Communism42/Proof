I=imread('cameraman.tif');
J=uint8(filter2(fspecial('gaussian'),I));
K=imsubtract(I,J);
subplot(221);imshow(I);title('ԭͼ');
subplot(222);imshow(J);title('���ɵı�������ͼ��');
subplot(223);imshow(K,[]);title('���֮���ͼ��');