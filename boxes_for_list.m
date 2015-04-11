
function boxes_for_list(set_file, img_path_pattern, save_path_pattern)

    fid = fopen(set_file);
    fields = textscan(fid, '%s');
    fclose(fid);
    images = fields{1};

    % Demo for Edge Boxes (please see readme.txt first).

    %% load pre-trained edge detection model and set opts (see edgesDemo.m)
    model=load('models/forest/modelBsds'); model=model.model;
    model.opts.multiscale=0; model.opts.sharpen=2; model.opts.nThreads=4;

    %% set up opts for edgeBoxes (see edgeBoxes.m)
    opts = edgeBoxes;
    opts.alpha = .65;     % step size of sliding window search
    opts.beta  = .75;     % nms threshold for object proposals
    opts.minScore = .01;  % min score of boxes to detect
    opts.maxBoxes = 1e4;  % max number of boxes to detect


    for ii = 1:length(images)
        img = images{ii};
        img_path = sprintf(img_path_pattern, img);
        save_path = sprintf(save_path_pattern, img);
        I = imread(img_path);
        try
            bbs=edgeBoxes(I,model,opts);
        catch ME
            fprintf('error: %s\n', ME.message);
            bbs = zeros(0, 5);
        end

        bbs = [bbs(:, 5), bbs(:, 1), bbs(:, 2), bbs(:, 1) + bbs(:, 3), bbs(:, 4) + bbs(:, 2)];
        dlmwrite(save_path, bbs);

        fprintf('%s\n', img);
    end
