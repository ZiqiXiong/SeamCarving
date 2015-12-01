clear;
I = im2double(imread('small_castle.jpg'));
I = reduceImage(I,100,50);
imshow(I);