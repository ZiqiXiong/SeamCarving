clear;
figure
subplot(1,3,1)
I = im2double(imread('small_castle.jpg'));
I = attachPositionToImage(I);
imshow(I(:,:,1:3))
subplot(1,3,2)
J = resizeImage(I,-100,-50);
imshow(J(:,:,1:3));
subplot(1,3,3)
H = markImage(I,J);
imshow(H(:,:,1:3));