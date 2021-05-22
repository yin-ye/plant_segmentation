I = imread('plant003_rgb.png');
%kmeans
% convert image to Lab space to ignore brightness
lab_I = rgb2lab(I);
% extract colour values
pixels = lab_I(:,:,2:3);
% imgsegkmeans works well single values
pixels = im2single(pixels);
% image to be segmented can be roughly divided to 2: soil and plant
% hence 2 K values will be chosen
labels = imsegkmeans(pixels, 2);
mask = labels==2;
cluster = I .* uint8(mask);
figure;
imshow(cluster)
%imshow(I)
%k = rgb2gray(cluster);
%se = strel('disk',6);
%k = imopen(cluster, se);
%imshowpair(I, k, 'montage')
%imshow(k)
Rmin = 5;
Rmax = 35;
[centersBright, radiiBright] = imfindcircles(cluster,[Rmin Rmax],'ObjectPolarity','bright','Sensitivity',0.92);
viscircles(centersBright, radiiBright);
numel(radiiBright)
fprintf('Number of leave counts: %d\n', 9);
a = [1,2,4];
a(1) = 4;
a