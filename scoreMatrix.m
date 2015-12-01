function [M,T] = scoreMatrix(E)
    M = E;
    [height,width] = size(E);
    T = ones(height, width);

    for h = 2:height
        for w = 1:width
            if w == 1
                prev = [Inf,M(h-1,w), M(h-1,w+1)];
            elseif w == width
                prev = [M(h-1,w-1), M(h-1,w), Inf];
            else
                prev = [M(h-1,w-1), M(h-1,w), M(h-1,w+1)];
            end
            [min_prev, min_prev_index] = min(prev);
            T(h,w) = min_prev_index;
            M(h,w) = E(h,w) + min_prev;
        end
    end
end