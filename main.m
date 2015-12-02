clear;
figure
subplot(1,2,1)
I = im2double(imread('small_castle.jpg'));
imshow(I)
subplot(1,2,2)
I = resizeImage(I,200,100);
imshow(I);