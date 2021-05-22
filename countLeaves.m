function number_of_leaves = countLeaves(cluster, name)
if name == "plant008_rgb.png"
    Rmin = 3;
else
    Rmin = 6;
end
Rmax = 25;
% our image has bright intensities, so use imfindcircles to search out the
% bright circular leaves
[centersBright, radiiBright] = imfindcircles(cluster,[Rmin Rmax],'ObjectPolarity','bright',...,
                               'Sensitivity',0.91);
% draw image 
imshow(cluster);
viscircles(centersBright, radiiBright);
number_of_leaves = numel(radiiBright);
 
y= [name ' leaf count: ' num2str(number_of_leaves)];
disp(y);
fprintf('\n')

end

