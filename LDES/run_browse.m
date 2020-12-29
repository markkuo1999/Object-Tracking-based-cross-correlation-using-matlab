% This script can be used to interactively inspect the results

addpath('C:\Users\markk\Downloads\vot-toolkit-master'); toolkit_path; % Make sure that VOT toolkit is in the path

[sequences, experiments] = workspace_load();

trackers = tracker_load('LDES');

workspace_browse(trackers, sequences, experiments);

