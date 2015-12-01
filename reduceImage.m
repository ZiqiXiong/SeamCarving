function I = reduceImage(I,vseams,hseams)
    for v = 1:1:vseams
        E = energyMatrix(I);
        [M,T] = scoreMatrix(E);
        [height,~] = size(I);
        [~,min_ind] = min(M(height,:));
        trace = findTrace(M,T,min_ind);
        I = removeSeam(I,trace);
    end
    
    I = imrotate(I,-90);
    for v = 1:1:hseams
        E = energyMatrix(I);
        [M,T] = scoreMatrix(E);
        [height,~] = size(I);
        [~,min_ind] = min(M(height,:));
        trace = findTrace(M,T,min_ind);
        I = removeSeam(I,trace);
    end
    
    I = imrotate(I,90);
end