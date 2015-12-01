function J = markImage(I,trace)
    J=I;
    [height,~] = size(J);
    for h=1:1:height
        J(h,trace(h),1) = 1;
    end
end