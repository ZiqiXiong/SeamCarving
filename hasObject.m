function yes = hasObject(I,removedRegion)
    [height,width,~] = size(I);
    yes = 0;
    for h = 1:1:height
        for w = 1:1:width
            x = I(h,w,4); y = I(h,w,5);
            if removedRegion(x,y) == 1
                yes = 1;
                break
            end
            if yes ==1
                break
            end
        end
    end
end