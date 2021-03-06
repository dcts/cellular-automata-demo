function [] = generateFIGURE()

% set global variables
global ax_h;
global panelSettings_h;
global buttonStart_h;
global popupmenu_h;
global textExplanation_h;
global IMAGEstart;
global figMain_h;

% load images
IMAGEstart = imread('logo.png');        % load "startscreen" pic


% window settings (get local screensize to place GUI in the center of screen)
width = 1020;       % change WINDOW width
height = 500;       % change WINDOW height
x = 0.5;            % left right calibration (0=left, 1=right)
y = 0.3;            % top bottom calibration (0=top, 1=bottom)
sSize = get(0,'ScreenSize');
sWidth = sSize(3); sHeight = sSize(4);
left = (sWidth-width)*x;
bottom = (sHeight-height)*(1-y);



%% CREATE FIGURE
figMain_h =  figure('Name', 'CELLULAR AUTOMATA (by thomas starzynski)', ...
    'NumberTitle', 'off', ...
    'position', [left bottom width height], ...
    'Resize', 'off', ...
    'Menubar', 'none');


    % AXIS Panel----------------------------------------------------------
    ax_h = axes('Parent',figMain_h, ...
        'Units', 'pixels', ...
        'Position',[45 45 380 380]);
    imagesc(IMAGEstart);
    title({'','',''});
    set(gca,'XTickLabel','', 'YTickLabel','')
    set(gca,'XTick',0, 'YTick',0)

    
    % SETTINGS Panel------------------------------------------------------
    panelSettings_h = uipanel('Title','SETTINGS', ...
        'Parent', figMain_h, ...
        'FontSize',12, ...
        'FontWeight', 'bold', ...
        'Units', 'pixels', ...
        'Position',[460 45 200 255]);

    
    % CONTROL Panel-------------------------------------------------------
    panelControl_h = uipanel('Title','CONTROL PANEL', ...
        'Parent', figMain_h, ...
        'FontSize',12, ...
        'FontWeight', 'bold', ...
        'Units', 'pixels', ...
        'Position',[460 310 200 115]);

        % button "start"
        buttonStart_h = uicontrol('style', 'pushbutton',...
            'Parent', panelControl_h, ...
            'String', 'START', ...
            'Units', 'normalized', ...
            'Position', [.05 .15 0.9 0.45], ...
            'Callback', @start_fun);

        % popupmenu
        popupmenu_h = uicontrol('Style', 'popup',...
            'Parent', panelControl_h, ...
            'String', {'Game Of Life','Majority Game','Copy Cat','Infection','Wolframs 1D Cellular Automata'},...
            'Units', 'normalized', ...
            'Position', [0.05 0.80 0.9 0.1], ...
            'Callback', @popupmenu_fun);
        
        
    % EXPLENATION Panel---------------------------------------------------
    panelExplanation_h = uipanel('Title','EXPLANATION', ...
        'Parent', figMain_h, ...
        'FontSize',12, ...
        'FontWeight', 'bold', ...
        'Units', 'pixels', ...
        'Position',[680 45 300 380]);

        % explanationText
        textExplanation_h = uicontrol('Style', 'text',...
            'Parent', panelExplanation_h, ...
            'Visible', 'on', ...         
            'HorizontalAlignment', 'left', ...
            'String', getExplanationText('GOL'), ...
            'Units', 'normalized', ...
            'Position', [.01 .01 .98 .98]);



    % TITLE RIGHT CORNER ABOVE---------------------------------------------
    % titleText_h
    uicontrol('Style', 'text',...
        'Parent', figMain_h, ...
        'Visible', 'on', ...         
        'HorizontalAlignment', 'right', ...
        'String', {'CELLULAR AUTOMATA DEMO',''}, ...
        'Units', 'pixels', ...
        'FontSize',20, ...
        'FontWeight','bold',...
        'Position', [460 460 515 28]);

    % subtitleText_h
    uicontrol('Style', 'text',...
        'Parent', figMain_h, ...
        'Visible', 'on', ...         
        'HorizontalAlignment', 'right', ...
        'String', {'by thomas starzynski'}, ...
        'Units', 'pixels', ...
        'FontSize',8, ...
        'Position', [460 425 515 28]);  
    
    % RESET BUTTON---------------------------------------------------------
    % buttonReset_h
    uicontrol('Style', 'pushbutton',...
        'Parent', figMain_h, ...
        'Visible', 'on', ...
        'String', 'reset', ...
        'Units', 'pixels', ...
        'Position', [596 285 55 20], ...
        'Callback', @setDefault_fun);

        
        
end




