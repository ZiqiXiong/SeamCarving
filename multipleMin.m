function [true_min, indices] = multipleMin(vector, tolerance)
    l = length(vector);
    true_min = min(vector);
    mins = repmat(true_min,1,l);
    diffs = vector-mins;
    find(diffs<tolerance)
end