function I = removeObject(I,direction,visualization)
    if visualization
        J=I;
    end
    removedRegion = roipoly(I(:,:,1:3));
    protectedRegion = roipoly(I(:,:,1:3));
    if direction == 'h'
            I = imrotate(I,-90);
    end
    while hasObject(I,removedRegion) 
        [height,~,~] = size(I);
        E = energyMatrix(I);
        E_weight = biasEnergyWeight(I,removedRegion,protectedRegion); 
        [M,T] = scoreMatrixWithWeight(E,E_weight);     
        [~,min_ind] = min(M(height,:));      
        trace = findTrace(M,T,min_ind);
        I = removeSeam(I,trace);
        if visualization
            if direction == 'h'
                H=markImage(J,imrotate(I,-90));
            else
                H=markImage(J,I);
            end
            imshow(H(:,:,1:3));
        end
    end
    if direction == 'h'
            I = imrotate(I,90);
    end
end