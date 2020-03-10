% extract.m
% 读取合并后的RGB图
Img = imread('D:\Matlab\document\merge1\3.png');
[M, N, Z] = size(Img);
Img = double(Img);
ImgR2 = Img(:,:,1);
ImgG2 = Img(:,:,2);
ImgB2 = Img(:,:,3);
Imgmarkextract = zeros(M, N, Z);
ImgmarkextractR = Imgmarkextract(:,:,1);
ImgmarkextractG = Imgmarkextract(:,:,2);
ImgmarkextractB = Imgmarkextract(:,:,3);
for i = 1 : M
    for j = 1 : N
    % 读取第零位平面
        if mod(ImgR2(i,j), 2) == 1
            ImgmarkextractR(i,j) = 1;
        end
        if mod(ImgG2(i,j), 2) == 1
        ImgmarkextractG(i,j) = 1;
        end
        if mod(ImgB2(i,j), 2) == 1
        ImgmarkextractB(i,j) = 1;
        end
    end
end
Imgmarkextract(:,:,1) = ImgmarkextractR;
Imgmarkextract(:,:,2) = ImgmarkextractG;
Imgmarkextract(:,:,3) = ImgmarkextractB;
figure;imshow(Imgmarkextract,[]);title('提取出的隐藏图');
imwrite(Imgmarkextract, 'D:\Matlab\document\extract1\1.png'); % 保存图片