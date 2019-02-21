function start_fun(~, ~)
    
    % load global variables
    global RUNNING;
    global buttonStart_h;
    global popupmenu_h;
    
    % switch state of Running
    % simulation currently running > STOP
    if RUNNING == 1     
        RUNNING = 0;
        buttonStart_h.String = 'START';
    
    % simulation not running > START
    else    
        RUNNING = 1;
        buttonStart_h.String = 'STOP';
        
        % get selection of popupmenu
        contents = get(popupmenu_h,'String');
        selection = contents{get(popupmenu_h,'Value')};
        
        switch selection
            case 'Game Of Life'
                game_of_life();
            case 'Majority Game'
                majority_game();
            case 'Copy Cat'
                copy_cat();                
            case 'Infection'
                infection();               
            case 'Wolframs 1D Cellular Automata'
                wolframCA();
        end
        
    end
    
    
    
    
end