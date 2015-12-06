function I = attachPositionToImage(I)
    [height,width,~] = size(I);
    hs = 1:1:height; ws =  1:1:width;
    hgrid = repmat(hs',1, width); wgrid = repmat(ws, height, 1);
    I(:,:,4) = hgrid; I(:,:,5) = wgrid;
end