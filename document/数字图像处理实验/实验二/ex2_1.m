f = imread('2_1.jpg');
h = imhist( f );
figure, imhist( f );
figure, plot( h );
figure, stem( h );
figure, bar( h );