% This script can be used to test the integration of a tracker to the
% framework.

addpath('C:\Users\markk\Downloads\vot-toolkit-master'); toolkit_path; % Make sure that VOT toolkit is in the path
addpath('C:\Users\markk\Downloads\vot-toolkit-master\native\trax\support\matlab');
[sequences, experiments] = workspace_load();

tracker = tracker_load('LDES');

workspace_test(tracker, sequences);

