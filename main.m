clear;
I = im2double(imread('castle.jpg'));
E = energyMatrix(I);

[M,T] = scoreMatrix(E);
