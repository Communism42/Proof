% main_merge2.m
% ��ͨ�����ۿɽ���λ��
yr = 4;
yg = 5;
yb = 3;

% ��ȡԭͼ
Img = imread('C:\Users\admin\Desktop\test\2.png');
figure;imshow(Img,[]);title('ԭͼ');
% ��ȡ�����ص�ͼ
image = imread('C:\Users\admin\Desktop\test\3.png');
%   �ֱ��ȡRGB
image_r=image(:,:,1);
image_g=image(:,:,2);
image_b=image(:,:,3);
Imgmark = [image_r;image_g;image_b];
figure;imshow(Imgmark,[]);title('��ͨ��ͼ�ϲ�ͼ');
imwrite(uint8(Imgmark), 'C:\Users\admin\Desktop\test\13.png'); % ����ͼƬ
Imgmark = double(Imgmark);
[markm, markn] = size(Imgmark);
% ���Ҷ�ͼ�Ķ�ά����ת��һ��
Imgmarkline = Imgmark(:);

% ��һ����ת��Ϊ������һ�У������ư�λ��ʾ
Imgmarklinebin = zeros(markm*markn*8,1);
for ii = 1 : markm*markn
    [Imgmarklinebin(8*ii-7), Imgmarklinebin(8*ii-6), Imgmarklinebin(8*ii-5), Imgmarklinebin(8*ii-4), Imgmarklinebin(8*ii-3),...
        Imgmarklinebin(8*ii-2), Imgmarklinebin(8*ii-1), Imgmarklinebin(8*ii)] = Find8bits(Imgmarkline(ii));   
end

%%
% ���RGB��ͨ������ͼ
Img = double(Img);
ImgR = Img(:,:,1);
ImgG = Img(:,:,2);
ImgB = Img(:,:,3);
% Ƕ��
% ���ں�ɫͨ��
embedNumsed = 0; % ��Ƕ�����
[M, N, Z] = size(Img);
y = zeros(8, 1);
flag = 0; % ���������ı�־

ImgRline = ImgR(:); % ת��Ϊһ��
ImgRlineNew = ImgRline; % Ƕ���
for ii = 1 : M*N
    if flag == 1 % �������ѭ��
       break;
    end
    
    [y(8), y(7), y(6), y(5), y(4), y(3), y(2), y(1)] = Find8bits(ImgRline(ii));   
    posNzreo = FindNotZero(y(8), y(7), y(6), y(5), y(4), y(3), y(2), y(1));
    embedNums = posNzreo - yr; % ��Ƕ��ĸ���
    if  embedNums > 0 %����Ƕ������
        for jj = 1 : embedNums
            embedNumsed = embedNumsed + 1; % ��Ƕ�����
            if embedNumsed > markm*markn*8 % Ƕ�����
               flag = 1; % ���ñ�ʶ��ʹ���ѭ��Ҳ����
               break;
            end
            
            y(jj) = Imgmarklinebin(embedNumsed);% Ƕ��
        end
    end
    ImgRlineNew(ii) = bin2dec_trans(y(8), y(7), y(6), y(5), y(4), y(3), y(2), y(1));% Ƕ����  
end
ImgR2 = reshape(ImgRlineNew, [M, N]);


% ����Gͨ��
ImgGline = ImgG(:); % ת��Ϊһ��
ImgGlineNew = ImgGline; % Ƕ���
for ii = 1 : M*N
    if flag == 1 % �������ѭ��
       break;
    end
    
    [y(8), y(7), y(6), y(5), y(4), y(3), y(2), y(1)] = Find8bits(ImgGline(ii));   
    posNzreo = FindNotZero(y(8), y(7), y(6), y(5), y(4), y(3), y(2), y(1));
    embedNums = posNzreo-yg; % ��Ƕ��ĸ���
    if  embedNums > 0 % ����Ƕ������
        for jj = 1 : embedNums
            embedNumsed = embedNumsed + 1; % ��Ƕ�����
            if embedNumsed > markm*markn*8 % Ƕ�����
               flag = 1; % ���ñ�ʶ��ʹ���ѭ��Ҳ����
               break;
            end
            
            y(jj) = Imgmarklinebin(embedNumsed); % Ƕ�� 
        end
    end
    ImgGlineNew(ii) = bin2dec_trans(y(8), y(7), y(6), y(5), y(4), y(3), y(2), y(1)); % Ƕ����  
end
ImgG2 = reshape(ImgGlineNew, [M, N]);

% ����Bͨ��
ImgBline = ImgB(:); % ת��Ϊһ��
ImgBlineNew = ImgBline; % Ƕ���
for ii = 1 : M*N
    if flag == 1 % �������ѭ��
       break;
    end
    
    [y(8), y(7), y(6), y(5), y(4), y(3), y(2), y(1)] = Find8bits(ImgBline(ii));   
    posNzreo = FindNotZero(y(8), y(7), y(6), y(5), y(4), y(3), y(2), y(1));
    embedNums = posNzreo - yb; % ��Ƕ��ĸ���
    if  embedNums > 0 % ����Ƕ������
        for jj = 1 : embedNums
            embedNumsed = embedNumsed + 1; % ��Ƕ�����
            if embedNumsed > markm*markn*8 % Ƕ�����
               flag = 1; % ���ñ�ʶ��ʹ���ѭ��Ҳ����
               break;
            end
            
            y(jj) = Imgmarklinebin(embedNumsed); % Ƕ�� 
        end
    end
    ImgBlineNew(ii) = bin2dec_trans(y(8), y(7), y(6), y(5), y(4), y(3), y(2), y(1)); % Ƕ����  
end
ImgB2 = reshape(ImgBlineNew, [M, N]);

ImgNew = zeros(M, N, Z);
ImgNew(:,:,1) = ImgR2;
ImgNew(:,:,2) = ImgG2;
ImgNew(:,:,3) = ImgB2;

figure;imshow(uint8(ImgNew),[]);title('�ϲ����ͼƬ');
imwrite(uint8(ImgNew), 'C:\Users\admin\Desktop\test\4.png'); % ����ͼƬ