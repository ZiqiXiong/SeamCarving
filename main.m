clear;
figure
tic
I = im2double(imread('images/castle.JPG'));
I = attachPositionToImage(I);
J = removeObject(I);
H = markImage(I,J);
% J = resizeImage(I,-100,-50);

figure
subplot(1,3,1)
imshow(I(:,:,1:3))

subplot(1,3,2)
imshow(J(:,:,1:3));

subplot(1,3,3)
imshow(H(:,:,1:3));
% toc