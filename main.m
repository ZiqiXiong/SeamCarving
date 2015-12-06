clear;
figure
tic
I = im2double(imread('images/castle.jpg'));
I = attachPositionToImage(I);
J = removeObject(I,'h',1);
%J = resizeImage(I,-100,-50);

figure
subplot(1,2,1)
imshow(I(:,:,1:3))

subplot(1,2,2)
imshow(J(:,:,1:3));

% toc