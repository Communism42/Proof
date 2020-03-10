% main_merge1.m
% 读取原图
Img = imread('D:\Matlab\document\merge1\1.png');
figure;imshow(Img,[]);title('原图')
% 读取待隐藏的图
Imgmark = imread('D:\Matlab\document\merge1\4.png');
[M, N, Z ] = size(Img);
[A, B, C] = size(Imgmark);
Img = double(Img);
ImgR2 = Img(:,:,1);
ImgG2 = Img(:,:,2);
ImgB2 = Img(:,:,3);

% 转为灰度图
Imgmark = rgb2gray(Imgmark);
% 转为二值图
Imgmark = im2bw(Imgmark);
figure;imshow(Imgmark,[]);title('待隐藏的图')


for i = 1 : M
for j = 1 : N
	    % 清空图A第零位平面
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
        % 加上图B的像素值
        ImgR2(i,j) = ImgR2(i,j) + Imgmark(i, j);
        ImgG2(i,j) = ImgG2(i,j) + Imgmark(i, j);
        ImgB2(i,j) = ImgB2(i,j) + Imgmark(i, j);
    end
end

% 三通道合并
ImgNew = zeros(M, N, Z);
ImgNew(:,:,1) = ImgR2;
ImgNew(:,:,2) = ImgG2;
ImgNew(:,:,3) = ImgB2;


figure;imshow(uint8(ImgNew),[]);title('合并后的RGB图');
imwrite(uint8(ImgNew), 'D:\Matlab\document\merge1\3.png'); % 保存图片

