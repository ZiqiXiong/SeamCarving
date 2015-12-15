function W = biasEnergyWeight(I,removedRegion,protectedRegion)
    [height,width,~] = size(I);
    W = ones(height,width);
    for h = 1:1:height
        for w = 1:1:width
            x = I(h,w,4); y = I(h,w,5);
            if removedRegion(x,y) == 1
                W(h,w) = -1000;
            elseif protectedRegion(x,y) == 1
                W(h,w) = 1000;
            end
        end
    end
end