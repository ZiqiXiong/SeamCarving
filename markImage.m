function I = markImage(I,J)
    [height, width, ~] = size(J);
    mask = zeros(size(I(:,:,1)));
    for h = 1:1:height
        for w = 1:1:width
            mask(J(h,w,4),J(h,w,5)) = 1;
        end
    end
   I(:,:,1) = I(:,:,1) .* mask;
   I(:,:,2) = I(:,:,2) .* mask;
   I(:,:,3) = I(:,:,3) .* mask;
end