clear;
I = im2double(imread('castle.jpg'));
I = imrotate(I,90);
E = energyMatrix(I);

[M,T] = scoreMatrix(E);

[height,~] = size(I);
ind = multipleMin(M(height,:),0.001);
trace = findTrace(M,T,ind);
for h=1:1:height
    I(h,trace(h),1) = 1;
end

imshow(I)
