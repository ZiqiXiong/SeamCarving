function trace = findTrace(M,T,start)
    [height, ~] = size(M);
    trace = 1:1:height;
    pointer = start;
    for h=height:-1:2
        trace(h) = pointer;
        if T(h,pointer) == 1
            pointer = pointer - 1;
        elseif T(h,pointer) == 3
            pointer = pointer + 1;
        end
    end
    trace(1) = pointer;
end