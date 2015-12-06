function A = scaleMatrix(A)
    A = (A - min(min(A)))./(max(max(A)) - min(min(A)));
end