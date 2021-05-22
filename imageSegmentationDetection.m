function imageSegmentationDetection()
% move to folder with plant images. Folder change within a function is golbal, 
% hence the current directory must be stored to navigate back to it.
oldFolder = pwd;

% get file path for plant images
cd 'plant_images';
path = pwd;
file = fullfile(path, '*.png');
d = dir(file);
cd(oldFolder);
% get file path for labelled images
cd 'plant_images_label';
path_label = pwd;
file_label = fullfile(path_label, '*.png');
d_label = dir(file_label);
cd(oldFolder);

mean_leaves = zeros(1, 16);
mean_ds = zeros(1, 16);
% loop through the plant images in a folder
for i=1:numel(d)
    I = fullfile(path, d(i).name);
    I = imread(I);
    
    L = fullfile(path_label, d_label(i).name);
    label_I = imread(L);
    
    % SEGMENT IMAGE USING KMEANS
    [mask, cluster] = kmeans_segmetation(I, d(i).name);
    
    % CALL DICE SIMILARITY SCORE FUNCTION
    ds = diceSimilarityScore(mask, label_I, d(i).name);
    mean_ds(i) = ds;
    % display DS for all images on figure window
    figure('Name', d(i).name, 'NumberTitle','off');
    
    % COUNT LEAVES, calls countLeaves()
    mean_leaves(i) = countLeaves(cluster, d(i).name);

end
leaves_d = double(mean(mean_leaves));
ds_d = double(mean(mean_ds));

fprintf('Mean number of leaves: %d\n', leaves_d);
fprintf('Mean DS: %d\n', ds_d);

end

