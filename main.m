clear;
I = im2double(imread('castle.jpg'));
I = reduceImage(I,100,50);
imshow(I);