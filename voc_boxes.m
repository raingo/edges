% Demo for Edge Boxes (please see readme.txt first).
%
addpath(genpath('./toolbox2/'));
base_dir = fullfile('/homes/ycli/rcnn/datasets/VOCdevkit2007/data/', subset);
save_dir = fullfile(base_dir, 'EdgeBoxes');

if ~exist(save_dir, 'dir')
    mkdir(save_dir);
end

img_path = fullfile(base_dir, 'JPEGImages', '%s.jpg');
set_file = fullfile(base_dir, 'ImageSets', 'Main', 'val.txt');
save_pattern = fullfile(save_dir, '%s.boxes2');

boxes_for_list(set_file, img_path, save_pattern);
