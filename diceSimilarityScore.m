function ds = diceSimilarityScore(mask, labelled_image, name)
    ds = 2*nnz(mask&labelled_image)/(nnz(mask) + nnz(labelled_image));
    
    y= [name ' DS Score: ' num2str(ds)];
    disp(y);
end

