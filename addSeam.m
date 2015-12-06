function I = addSeam(I,trace)
    [height,width,~] = size(I);
    I = [I ones(height,1,5)];
    for h = 1:1:height
        t = trace(h);
        I(h,t+1:width+1,:) = I(h,t:width,:);
        if t >1
            I(h,t,:) = (I(h,t-1,:)+I(h,t+1,:))/2;
        else
            I(h,t,:) = I(h,t+1,:);
        end
    end
end