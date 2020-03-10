I=imread('cameraman.tif');
%J = imnoise(I,'gauss',0,0.02); %添加高斯噪声
J = imnoise(I,'salt & pepper',0.02); %添加椒盐噪声
ave1=fspecial('average',3); %产生 3×3 的均值模版
ave2=fspecial('average',6); %产生 5×5 的均值模版
K = filter2(ave1,J)/255; %均值滤波 3×3
L = filter2(ave2,J)/255; %均值滤波 5×5
M = medfilt2(J,[3 3]); %中值滤波 3×3 模板
N = medfilt2(J,[9 9]); %中值滤波 4×4 模板
subplot(231),imshow(I);title('原图');
%subplot(232),imshow(J);title('添加高斯噪声后');
subplot(232),imshow(J);title('添加胡椒噪声后');
subplot(233),imshow(K);title('均值滤波3×3');
subplot(234),imshow(L);title('均值滤波5×5');
subplot(235),imshow(M);title('中值滤波3×3');
subplot(236),imshow(N);title('中值滤波4×4');