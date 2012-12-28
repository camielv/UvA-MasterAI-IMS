%% Dataset creator
video       = load('FRAMES.mat');
video_cells = struct2cell(video.FRAMES);
frames      = video_cells(1, :);
num_frames  = size(frames, 2);
annotation  = zeros(num_frames, 2);

for i = 1:num_frames
    frame = im2double(frames{i});
    imshow(frame);
    drawnow;
    annotation(i,:) = ginput(1);
end

%% Draw annotation
annotation = struct2cell(load( 'PLAYER1.mat' ));
annotation = annotation{1};

results = struct2cell(load( 'results_player1.mat' ));
rgb_bf  = results{1};
rgb_ms  = results{2};
RGB_ms  = results{3};
RGB_bf  = results{4};

for i = 1:num_frames
    frame = im2double(frames{i});
    imshow(frame);
    hold on;
    scatter(rgb_bf(i, 1), rgb_bf(i,2));
    scatter(rgb_ms(i, 1), rgb_ms(i,2));
    scatter(RGB_ms(i, 1), RGB_ms(i,2));
    scatter(RGB_bf(i, 1), RGB_bf(i,2));
    scatter(annotation(i, 1), annotation(i,2));
    hold off;
    drawnow;
end