[I,map]=imread('cameraman.tif'); 
subplot(221),imshow(I,map);title('ԭͼ');%����ԭͼ���ļ� %��ʾԭͼ��
fftI=fft2(I); %��ά��ɢ����Ҷ�任
sfftI=fftshift(fftI); %ֱ�������Ƶ�Ƶ������
RR=real(sfftI); %ȡ����Ҷ�任��ʵ��
II=imag(sfftI); %ȡ����Ҷ�任���鲿
A=sqrt(RR.^2+II.^2);%����Ƶ�׷�ֵ
A=(A-min(min(A)))/(max(max(A))-min(min(A)))*225;%��һ��
subplot(222),imshow(A);title('Ƶ��'); %��ʾԭͼ���Ƶ��
%��˹�˲�
sigma = 1;
gausFilter = fspecial('gaussian', [5,5], sigma);
gaus= imfilter(A, gausFilter, 'replicate');
subplot(223),imshow(A);title('��˹�˲�֮���Ƶ��ͼ��');
%��ͨ�˲�
I=A;
I=im2double(I);
M=2*size(I,1);  %�˲���������
N=2*size(I,2);  %�˲���������
u=-M/2:(M/2-1);
v=-N/2:(N/2-1);
[U,V]=meshgrid(u,v);
D=sqrt(U.^2+V.^2);
D0=80;  %��ֹƵ��,����Ϊ80
H=double(D<=D0);  %�����ͨ�˲���
J=fftshift(fft2(I,size(H,1),size(H,2)));  %ʱ��ͼ��ת����Ƶ��
K=J.*H;  %�˲�����
L=ifft2(ifftshift(K));  %����Ҷ���任
L=L(1:size(I,1),1:size(I,2));
subplot(224),imshow(L);title('��ͨ�˲�֮���ͼ��');  %��ʾ�˲����ͼ��


