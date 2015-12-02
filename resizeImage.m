function I = resizeImage(I,vseams,hseams)
    for v = 1:1:abs(vseams)
        E = energyMatrix(I);
        [M,T] = scoreMatrix(E);
        [height,~] = size(I);
        [~,min_ind] = min(M(height,:));
        trace = findTrace(M,T,min_ind);
        if vseams < 0
            I = removeSeam(I,trace);
        else
            I = addSeam(I,trace);
        end
    end
    
    I = imrotate(I,-90);
    for h = 1:1:abs(hseams)
        E = energyMatrix(I);
        [M,T] = scoreMatrix(E);
        [height,~] = size(I);
        [~,min_ind] = min(M(height,:));
        trace = findTrace(M,T,min_ind);
        if hseams < 0
            I = removeSeam(I,trace);
        else
            I = addSeam(I,trace);
        end
    end
    
    I = imrotate(I,90);
end