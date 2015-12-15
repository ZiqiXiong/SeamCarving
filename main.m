clear;
tic
I = im2double(imread('images/007-2.jpg'));
I = attachPositionToImage(I);
J = removeObject(I,'v',1);
%J = resizeImage(I,-100,-50,1);

figure
title('original image')
imshow(I(:,:,1:3))

figure
title('new image')
imshow(J(:,:,1:3));

% toc