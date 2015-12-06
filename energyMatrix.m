function E = energyMatrix(I)
    I_R = I(:,:,1); I_G = I(:,:,2); I_B = I(:,:,3);
    E_R = imgradient(I_R); E_G = imgradient(I_G); E_B = imgradient(I_B); 
    E = (E_R + E_G + E_B)/3;   
end