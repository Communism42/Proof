k = imread('lena.bmp');
I = rgb2gray(k);
imshow(I)
bw1=edge(I,'roberts'); %使用 roberts 算子进行边缘检测
bw2=edge(I,'sobel'); %使用 sobel 算子进行边缘检测
bw3=edge(I,'prewitt'); %使用 prewitt 算子进行边缘检测
bw4=edge(I,'canny'); %使用 canny 算子进行边缘检测
bw5=edge(I,'log'); %使用 log 算子进行边缘检测
figure,imshow(bw1);title('使用 roberts 算子进行边缘检测');
figure,imshow(bw2);title('使用 sobel 算子进行边缘检测');
figure,imshow(bw3);title('使用 prewitt 算子进行边缘检测');
figure,imshow(bw4);title('使用 canny 算子进行边缘检测');
figure,imshow(bw5);title('使用 log 算子进行边缘检测');