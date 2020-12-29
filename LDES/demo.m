close all;
%~/Data/tob100
%~/Data/tb100/
datasets={ struct('name','OTB-100','basePath','videos/')};
    
%default settings for demo
show_visualization = 1; 
show_plots = 1;

%preview(mycam);

% Create axes control.
handleToAxes = axes();
% Get the handle to the image in the axes.
hImage = image(zeros(1080,1920));
% Reset image magnification. Required if you ever displayed an image
% in the axes that was not the same size as your webcam image.
hold off;
axis auto;
axis on;
% Enlarge figure to full screen.
%set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
% Turn on the live video.
%videoObject = videoinput('winvideo', 1);
%m = mobiledev;
videoObject = camera(m,'back');
%webcamlist;
%mycam = webcam;
preview(videoObject, hImage);
hold on


[video, base_path, dataset] = choose_video(datasets);

% video = 'Toy';
% base_path = 'videos/';
% dataset = 'OTB-100';

%get image file names, initial state, and ground truth for evaluation
[img_files, pos, target_sz, rot,ground_truth, video_path,datasetParam] = load_video_info(base_path, video,dataset);
%[pos, target_sz, rot, ground_truth] = load_camera_info(videoObject);

%disp(target_sz);

%call tracker function with all the relevant parameters
[~,rects,~,~,~, time] = tracker(video_path, img_files, pos, target_sz, rot, show_visualization);
%[~,rects,~,~,~, time] = tracker_camera(videoObject,pos,target_sz,rot,show_visualization);
%calculate and show precision plot, as well as frames-per-second
precisions = precision_plot(rects(:,[1,2]), ground_truth, video, show_plots);
fps = numel(img_files) / time;

fprintf('%12s - Precision (20px):% 1.3f, FPS:% 4.2f\n', video, precisions(20), fps)

%return precisions at a 20 pixels threshold
precision = precisions(20);
