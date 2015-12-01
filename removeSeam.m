function I = removeSeam(I,trace)
    [height,width,~] = size(I);
    for h = 1:1:height
        t = trace(h);
        if t > 1
            I(h,2:t,:) = I(h,1:t-1,:);
        end
    end
    I = I(:,2:width,:);
end