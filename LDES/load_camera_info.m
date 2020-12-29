function [pos, target_sz, rot, ground_truth] = load_camera_info(videoObject)
    rot = 0;
    roi = drawrectangle;
    location = get(roi,'Position');
    x1 = location(1);
    y1 = location(2);
    width = location(3);
    height = location(4);
    ground_truth = [x1, y1, width, height];
    target_sz = [ground_truth(1,4), ground_truth(1,3)];
    pos = [ground_truth(1,2), ground_truth(1,1)] + floor(target_sz/2);
end