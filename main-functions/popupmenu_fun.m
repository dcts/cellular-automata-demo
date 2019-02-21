function popupmenu_fun(~, ~)
    
    % get global variables
    global buttonStart_h;
    global popupmenu_h;
    global ax_h;
    global textExplanation_h;
    
    global WOLF;
    global RUNNING;
    global interrupted;
    global IMAGEstart;
       
    % check if simulation is currently running
    interrupted = 0;
    if RUNNING == 1  % if running...
        RUNNING = 0;      % ...stop simulation and...
        buttonStart_h.String = 'START'; % ...change "START" to "STOP"
        interrupted = 1;
    end
        
    % get value of selected popupmenu
    contents = get(popupmenu_h,'String');
    selection = contents{get(popupmenu_h,'Value')};
    
    % reset image
    ax_h = imagesc(IMAGEstart);
    title(gca,{'','',''});
    set(gca,'XTickLabel','', 'YTickLabel','')
    set(gca,'XTick',0, 'YTick',0)
    
    % set button visible
    buttonStart_h.Visible = 'on';
    
    % show selectet setting panels! hide all other panels!
    switch selection
        case char('Game Of Life')
            turnMG('off');
            turnCC('off');
            turnINF('off');
            turnWOLF('off');
            textExplanation_h.String = getExplanationText('GOL');
            turnGOL('on');
            
        case char('Majority Game') 
            turnGOL('off');
            turnCC('off');
            turnINF('off');
            turnWOLF('off')
            textExplanation_h.String = getExplanationText('MG');
            turnMG('on');
            
        case char('Copy Cat')  
            turnGOL('off');
            turnMG('off');
            turnINF('off');
            turnWOLF('off')
            textExplanation_h.String = getExplanationText('CC');
            turnCC('on');
            
        case char('Infection')
            turnGOL('off');
            turnMG('off');
            turnCC('off');
            turnWOLF('off')
            textExplanation_h.String = getExplanationText('INF');
            turnINF('on');
            
        case char('Wolframs 1D Cellular Automata')
            turnGOL('off');
            turnMG('off');
            turnCC('off');
            turnINF('off');
            textExplanation_h.String = getExplanationText('WOLF');
            turnWOLF('on');  
            if WOLF.INFINITYLOOP == 0
                start_fun;
                buttonStart_h.Visible = 'off';
            end
    end
end




function [] = turnGOL(str)
    global GOLtext1_h;          % text: N
    global GOLtext2_h;          % text: ALIVE
    global GOLtext3_h;          % text: PROB_MUTATION
    global GOLtext4_h;          % text: RANDOM_GLODERS
    global GOLtext5_h;          % text: PAUSE
    global GOLeditbox1_h;           % value: N
    global GOLeditbox2_h;           % value: ALIVE
    global GOLeditbox3_h;           % value: PROB_MUTATION
    global GOLcheckbox4_h;          % value: RANDOM_GLIDERS (checkbox)
    global GOLeditbox5_h;           % value: PAUSE
    GOLtext1_h.Visible = str;
    GOLtext2_h.Visible = str;
    GOLtext3_h.Visible = str;
    GOLtext4_h.Visible = str;
    GOLtext5_h.Visible = str;
    GOLeditbox1_h.Visible = str;
    GOLeditbox2_h.Visible = str;
    GOLeditbox3_h.Visible = str;
    GOLcheckbox4_h.Visible = str;
    GOLeditbox5_h.Visible = str;
end



function [] = turnMG(str)
    global MGtext1_h;       % text: N
    global MGtext2_h;       % text: ALIVE
    global MGtext3_h;       % text: PROB_MUTATION
    global MGtext4_h;       % text: VISIBILITY
    global MGtext5_h;       % text: MAJ_REQUIRED
    global MGtext6_h;       % text: PROB_UPDATE
    global MGeditbox1_h;        % value: N
    global MGeditbox2_h;        % value: ALIVE
    global MGeditbox3_h;        % value: PROB_MUTATION
    global MGeditbox4_h;        % value: VISIBILITY
    global MGeditbox5_h;        % value: MAJ_REQUIRED
    global MGeditbox6_h;        % value: PROB_UPDATE
    MGtext1_h.Visible = str;
    MGtext2_h.Visible = str;
    MGtext3_h.Visible = str;
    MGtext4_h.Visible = str;
    MGtext5_h.Visible = str;
    MGtext6_h.Visible = str;
    MGeditbox1_h.Visible = str;
    MGeditbox2_h.Visible = str;
    MGeditbox3_h.Visible = str;
    MGeditbox4_h.Visible = str;
    MGeditbox5_h.Visible = str;
    MGeditbox6_h.Visible = str;
end



function [] = turnCC(str)
    global CCtext1_h;           % text: N
    global CCtext2_h;           % text: GROUPS
    global CCtext3_h;           % text: PROB_COPY
    global CCtext4_h;           % text: PROB_CONTRARIAN
    global CCtext5_h;           % text: TYPE
    global CCeditbox1_h;            % value: N
    global CCeditbox2_h;            % value: GROUPS
    global CCeditbox3_h;            % value: PROB_COPY
    global CCeditbox4_h;            % value: PROB_CONTRARIAN
    global CCpopupmenu5_h;          % value: TYPE (popupmenu)
    CCtext1_h.Visible = str;
    CCtext2_h.Visible = str;
    CCtext3_h.Visible = str;
    CCtext4_h.Visible = str;
    CCtext5_h.Visible = str;
    CCeditbox1_h.Visible = str;
    CCeditbox2_h.Visible = str;
    CCeditbox3_h.Visible = str;
    CCeditbox4_h.Visible = str;
    CCpopupmenu5_h.Visible = str;
end



function [] = turnINF(str)
    global INFtext1_h;
    global INFtext2_h;
    global INFeditbox1_h;
    global INFeditbox2_h;
    INFtext1_h.Visible = str;
    INFtext2_h.Visible = str;
    INFeditbox1_h.Visible = str;
    INFeditbox2_h.Visible = str;
end



function [] = turnWOLF(str)
    global WOLFtext1_h;
    global WOLFtext2_h;
    global WOLFeditbox1_h;
    global WOLFslider2_h;
    global WOLFcheckbox3_h;
    WOLFtext1_h.Visible = str;
    WOLFtext2_h.Visible = str;
    WOLFeditbox1_h.Visible = str;
    WOLFslider2_h.Visible = str;
    WOLFcheckbox3_h.Visible = str;
end