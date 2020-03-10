[I,map]=imread('cameraman.tif'); 
subplot(221),imshow(I,map);title('原图');%读入原图像文件 %显示原图像
fftI=fft2(I); %二维离散傅立叶变换
sfftI=fftshift(fftI); %直流分量移到频谱中心
RR=real(sfftI); %取傅立叶变换的实部
II=imag(sfftI); %取傅立叶变换的虚部
A=sqrt(RR.^2+II.^2);%计算频谱幅值
A=(A-min(min(A)))/(max(max(A))-min(min(A)))*225;%归一化
subplot(222),imshow(A);title('频谱'); %显示原图像的频谱
%高斯滤波
sigma = 1;
gausFilter = fspecial('gaussian', [5,5], sigma);
gaus= imfilter(A, gausFilter, 'replicate');
subplot(223),imshow(A);title('高斯滤波之后的频谱图像');
%低通滤波
I=A;
I=im2double(I);
M=2*size(I,1);  %滤波器的行数
N=2*size(I,2);  %滤波器的列数
u=-M/2:(M/2-1);
v=-N/2:(N/2-1);
[U,V]=meshgrid(u,v);
D=sqrt(U.^2+V.^2);
D0=80;  %截止频率,设置为80
H=double(D<=D0);  %理想低通滤波器
J=fftshift(fft2(I,size(H,1),size(H,2)));  %时域图像转换到频域
K=J.*H;  %滤波处理
L=ifft2(ifftshift(K));  %傅立叶反变换
L=L(1:size(I,1),1:size(I,2));
subplot(224),imshow(L);title('低通滤波之后的图像');  %显示滤波后的图像


