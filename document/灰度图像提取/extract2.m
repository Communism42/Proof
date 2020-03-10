% main_extract2.m
% ��ͨ�����ۿɽ���λ��
yr = 4;
yg = 5;
yb = 3;

% ��ȡ�ϲ����RGBͼ
Img = imread('C:\Users\admin\Desktop\test\4.png');
figure;imshow(Img,[]);title('�ϲ����ͼ��');
%��ȡ����ͼ��
image = imread('C:\Users\admin\Desktop\test\3.png');
figure;imshow(image,[]);title('�������ص�ͼ��');
[A,B,C] = size(image);
[M, N, Z] = size(Img);
Img = double(Img);
ImgR2 = Img(:,:,1);
ImgG2 = Img(:,:,2);
ImgB2 = Img(:,:,3);

% ��ȡǶ��ͼ��
flag = 0;
Imgmark_extractlinebin = zeros(M*N*8, 1);
extractNumsed = 0; % ����ȡ����

% Rͨ��
ImgRline2 = ImgR2(:); % ת��Ϊһ��
for i = 1 : M*N
    if flag == 1 % �������ѭ��
       break;
    end
    
    [y(8), y(7), y(6), y(5), y(4), y(3), y(2), y(1)] = Find8bits(ImgRline2(i));   
    posNzreo = FindNotZero(y(8), y(7), y(6), y(5), y(4), y(3), y(2), y(1));
    embedNums = posNzreo - yr; % ��Ƕ��ĸ���
    if  embedNums > 0 % ����Ƕ������
        for jj = 1 : embedNums
            
            extractNumsed = extractNumsed + 1; % ����ȡ����
            if extractNumsed > M*N*8 % ��ȡ���
               flag = 1; % ���ñ�ʶ��ʹ���ѭ��Ҳ����
               break;
            end 
            
           Imgmark_extractlinebin(extractNumsed) = y(jj); % ��ȡ
        end  
    end  
end

% Gͨ��
ImgGline2 = ImgG2(:); % ת��Ϊһ��
for i = 1 : M*N
    if flag == 1 % �������ѭ��
       break;
    end
    
    [y(8), y(7), y(6), y(5), y(4), y(3), y(2), y(1)] = Find8bits(ImgGline2(i));   
    posNzreo = FindNotZero(y(8), y(7), y(6), y(5), y(4), y(3), y(2), y(1));
    embedNums = posNzreo - yg; % ��Ƕ��ĸ���
    if embedNums > 0 % ����Ƕ������
        for jj = 1:embedNums
            
            extractNumsed = extractNumsed + 1; % ����ȡ����
            if extractNumsed > M*N*8 % ��ȡ���
               flag = 1; % ���ñ�ʶ��ʹ���ѭ��Ҳ����
               break;
            end
            
           Imgmark_extractlinebin(extractNumsed) = y(jj);% ��ȡ
        end
    end
end

%  Bͨ��
ImgBline2 = ImgB2(:); % ת��Ϊһ��
for i = 1:M*N
    if flag == 1 % �������ѭ��
       break;
    end
    
    [y(8), y(7), y(6), y(5), y(4), y(3), y(2), y(1)] = Find8bits(ImgBline2(i));   
    posNzreo = FindNotZero(y(8), y(7), y(6), y(5), y(4), y(3), y(2), y(1));
    embedNums = posNzreo - yb; % ��Ƕ��ĸ���
    if embedNums > 0 % ����Ƕ������
        for jj = 1 : embedNums
            
            extractNumsed = extractNumsed + 1; % ����ȡ����
            if extractNumsed > M*N*8 % ��ȡ���
               flag = 1; % ���ñ�ʶ��ʹ���ѭ��Ҳ����
               break;
            end
            
           Imgmark_extractlinebin(extractNumsed) = y(jj); % ��ȡ
        end
    end
end

% ������תʮ����
Imgmarklinedec = zeros(A*B, 1); % ת��Ϊʮ����
for i = 1 : A*B
    Imgmarklinedec(i) = bin2dec_trans(Imgmark_extractlinebin(8*i-7), Imgmark_extractlinebin(8*i-6), Imgmark_extractlinebin(8*i-5), Imgmark_extractlinebin(8*i-4),...
                                     Imgmark_extractlinebin(8*i-3), Imgmark_extractlinebin(8*i-2), Imgmark_extractlinebin(8*i-1), Imgmark_extractlinebin(8*i));
end
Imgmarkextract = reshape(Imgmarklinedec, [A,B]);
figure;imshow(Imgmarkextract,[]);title('��ȡ��������ͼ');
imwrite(uint8(Imgmarkextract), 'C:\Users\admin\Desktop\test\5.png'); % ����ͼƬ