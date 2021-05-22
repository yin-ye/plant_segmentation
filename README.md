# Plant seedling segmentation and automatic leaf counting
Segments plant leaves based on k-means segmentation algorithm and automatically counts the leaves

## Requirements
- MATLAB

## Module documentation
Following is a list of functions and classes exported by modules.
- kmeans_segmetation(I, file_name): uses MATLAB's imsegmeans to extract images masks and segments images.
- diceSimilarityScore(mask, labelled_image, name): calculates the dice similarity score using the segmented and ground truth images.
- countLeaves(cluster, name): counts leaves of segmented images.
- imageSegmentationDetection(): compiles all the functions and displays output 
 

 
