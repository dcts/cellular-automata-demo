   
%%  CELLULAR AUTOMATA DEMO (by thomas starzynski)
%   game of life, majority game, copy cat, infection, wolframs 1d CA
%   university of basel - 2016

clear; close all; clc;      % clear memory and close all windows
clear global;               % clear all global variables
addpath(genpath(cd))        % add all child-folders to path!



%%  MAIN PROGRAMM
                   
%   generate main structure
    generateGUI();   

%   generate settings
    generateGOLSettings('on');
    generateMGSettings('off');
    generateCCSettings('off');
    generateINFSettings('off');
    generateWOLFSettings('off');

%   set default setting values
    setDefault_fun(1,1);     % can be used also to initialize values!

    