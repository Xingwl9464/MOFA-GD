
% Retrieve the directory where the current script is located
currentDir = pwd;
if ispc % Windows
    separator = ';';
else % Linux or Mac
    separator = ':';
end

% Add DataSet folder and its subfolders to MATLAB work path
paths = strsplit(path, separator); 
datasetPath = fullfile(currentDir, 'DataSet');
if ~ismember(datasetPath, paths)
    addpath(genpath(datasetPath));
end

% Add MOFA-GD folder and its subfolders to MATLAB work path
mmofaMnPath = fullfile(currentDir, 'MOFA-GD');
if ~ismember(mmofaMnPath, paths)
    addpath(genpath(mmofaMnPath));
end

% Optional: Save the current path settings so that they remain valid the next time MATLAB is launched
% savepath;

% run single problem / test-function
%   param1: time     / When running the same test function independently, record the current number of times
%   param2: n        / Population size
%   param3: nEL      / Maximum external file capacity
%   param4: tMax     / Maximum Number Of Iterations
%   param5: problem  / Test-function 
mofa_new(1, 100, 100, 100, 'DTLZ1')

% The running results are stored in a mat file, 
% named in the format of 
% "Problem" _ "time" _ "n" _ "tMax". mat


% If you want to modify the control parameter n, 
% you can open the mofa_new. m file 
% and modify the parameter pn


