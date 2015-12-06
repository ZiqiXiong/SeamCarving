function [M,T] = scoreMatrix(E)
    [height,width] = size(E);
    E_weight = ones(height,width);
    [M,T] = scoreMatrixWithWeight(E,E_weight);
end