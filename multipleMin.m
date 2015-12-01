function [indices,true_min] = multipleMin(vector, tolerance)
    l = length(vector);
    true_min = min(vector);
    mins = repmat(true_min,1,l);
    diffs = vector-mins;
    indices = find(diffs<tolerance);
end