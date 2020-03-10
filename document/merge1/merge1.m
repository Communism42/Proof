% main_merge1.m
% ��ȡԭͼ
Img = imread('D:\Matlab\document\merge1\1.png');
figure;imshow(Img,[]);title('ԭͼ')
% ��ȡ�����ص�ͼ
Imgmark = imread('D:\Matlab\document\merge1\4.png');
[M, N, Z ] = size(Img);
[A, B, C] = size(Imgmark);
Img = double(Img);
ImgR2 = Img(:,:,1);
ImgG2 = Img(:,:,2);
ImgB2 = Img(:,:,3);

% תΪ�Ҷ�ͼ
Imgmark = rgb2gray(Imgmark);
% תΪ��ֵͼ
Imgmark = im2bw(Imgmark);
figure;imshow(Imgmark,[]);title('�����ص�ͼ')


for i = 1 : M
for j = 1 : N
	    % ���ͼA����λƽ��
        if mod(ImgR2(i,j), 2) == 1
            ImgR2(i,j) = ImgR2(i,j) - 1;
        end
        if mod(ImgG2(i,j), 2) == 1
            ImgG2(i,j) = ImgG2(i,j) - 1;
        end
        if mod(ImgB2(i,j), 2) == 1
            ImgB2(i,j) = ImgB2(i,j) - 1;
        end
        if i>A||j>B
           Imgmark(i,j)= 0;
        end
        % ����ͼB������ֵ
        ImgR2(i,j) = ImgR2(i,j) + Imgmark(i, j);
        ImgG2(i,j) = ImgG2(i,j) + Imgmark(i, j);
        ImgB2(i,j) = ImgB2(i,j) + Imgmark(i, j);
    end
end

% ��ͨ���ϲ�
ImgNew = zeros(M, N, Z);
ImgNew(:,:,1) = ImgR2;
ImgNew(:,:,2) = ImgG2;
ImgNew(:,:,3) = ImgB2;


figure;imshow(uint8(ImgNew),[]);title('�ϲ����RGBͼ');
imwrite(uint8(ImgNew), 'D:\Matlab\document\merge1\3.png'); % ����ͼƬ

