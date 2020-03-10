I=imread('eight.tif');
imshow(I)
c=[222 272 300 270 224 194];
r=[21  21  75  129 129 75];
BW=roipoly(I,c,r);
figure,imshow(BW)
H=fspecial('unsharp');
J1=roifilt2(H,I,BW);
figure,imshow(J1)
J2=regionfill(I,c,r);
figure,imshow(J2)