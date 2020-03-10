I=imread('cameraman.tif');
%J = imnoise(I,'gauss',0,0.02); %��Ӹ�˹����
J = imnoise(I,'salt & pepper',0.02); %��ӽ�������
ave1=fspecial('average',3); %���� 3��3 �ľ�ֵģ��
ave2=fspecial('average',6); %���� 5��5 �ľ�ֵģ��
K = filter2(ave1,J)/255; %��ֵ�˲� 3��3
L = filter2(ave2,J)/255; %��ֵ�˲� 5��5
M = medfilt2(J,[3 3]); %��ֵ�˲� 3��3 ģ��
N = medfilt2(J,[9 9]); %��ֵ�˲� 4��4 ģ��
subplot(231),imshow(I);title('ԭͼ');
%subplot(232),imshow(J);title('��Ӹ�˹������');
subplot(232),imshow(J);title('��Ӻ���������');
subplot(233),imshow(K);title('��ֵ�˲�3��3');
subplot(234),imshow(L);title('��ֵ�˲�5��5');
subplot(235),imshow(M);title('��ֵ�˲�3��3');
subplot(236),imshow(N);title('��ֵ�˲�4��4');