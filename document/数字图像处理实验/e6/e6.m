k = imread('lena.bmp');
I = rgb2gray(k);
imshow(I)
bw1=edge(I,'roberts'); %ʹ�� roberts ���ӽ��б�Ե���
bw2=edge(I,'sobel'); %ʹ�� sobel ���ӽ��б�Ե���
bw3=edge(I,'prewitt'); %ʹ�� prewitt ���ӽ��б�Ե���
bw4=edge(I,'canny'); %ʹ�� canny ���ӽ��б�Ե���
bw5=edge(I,'log'); %ʹ�� log ���ӽ��б�Ե���
figure,imshow(bw1);title('ʹ�� roberts ���ӽ��б�Ե���');
figure,imshow(bw2);title('ʹ�� sobel ���ӽ��б�Ե���');
figure,imshow(bw3);title('ʹ�� prewitt ���ӽ��б�Ե���');
figure,imshow(bw4);title('ʹ�� canny ���ӽ��б�Ե���');
figure,imshow(bw5);title('ʹ�� log ���ӽ��б�Ե���');