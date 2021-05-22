function [mask, cluster] = kmeans_segmetation(I, file_name)
% convert image to Lab space to ignore brightness
lab_I = rgb2lab(I);
% extract colour values
pixels = lab_I(:,:,2:3);
% imgsegkmeans works well single values
pixels = im2single(pixels);
% image to be segmented can be roughly divided to 2: soil and plant
% hence 2 K values will be chosen
labels = imsegkmeans(pixels, 2);
% obtain mask of the plant, depending of the image
if file_name == "plant011_rgb.png" || file_name == "plant013_rgb.png" || file_name == "plant015_rgb.png" || file_name == "plant016_rgb.png" 
    mask = labels==1;
else
    mask = labels==2;
end
% extract segmented image from the mask
cluster = I .* uint8(mask);

end

