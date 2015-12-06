function I = resizeImage(I,vseams,hseams,visualization)
    if visualization
        J = I;
    end
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
        if visualization
            H = markImage(J,I);
            imshow(H(:,:,1:3))
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
        if visualization
            H = markImage(J,imrotate(I,-90));
            imshow(H(:,:,1:3))
        end
    end
    
    I = imrotate(I,90);
end