clear;
I = im2double(imread('castle.jpg'));
E = energyMatrix(I);
[M,T] = scoreMatrix(E);
[height,~] = size(I);
ind = multipleMin(M(height,:),20);
J=I;
for i = ind
    trace = findTrace(M,T,i);
    J = markImage(J,trace);
end
imshow(J)
