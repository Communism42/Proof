A=zeros(128);
A(40:67,60:100)=1;
B=zeros(128);
B(50:80,40:70)=1;
C=and(A,B);
D=or(A,B);
E=not(B);
F=xor(A,B);
subplot(231);imshow(A);title('A图')
subplot(232);imshow(B);title('B图')
subplot(233);imshow(C);title('A和B相与图')
subplot(234);imshow(D);title('A和B相或图')
subplot(235);imshow(E);title('B取反图')
subplot(236);imshow(F);title('A和B异或图')