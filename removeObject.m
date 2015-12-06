function I = removeObject(I)
    J=I;
    removedRegion=roipoly(I(:,:,1:3));
    while hasObject(I,removedRegion) == 1
        [height,~,~] = size(I);
        E = energyMatrix(I);
        E_weight = biasEnergyWeight(I,removedRegion); 
        [M,T] = scoreMatrixWithWeight(E,E_weight);     
        [~,min_ind] = min(M(height,:));      
        trace = findTrace(M,T,min_ind);
        I = removeSeam(I,trace);
        H=markImage(J,I);
        imshow(H(:,:,1:3));
    end

end