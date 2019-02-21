function [  ] = setDefault_fun(~,~)
% setdefault_fun: use to initialize default values or to restore default
%   values (reset button)!
    
    % load global variables
    global RUNNING;
    global GOL;
    global MG;
    global CC;
    global INF;
    global WOLF;
    global ax_h;
    global IMAGEstart;
    
    % set global variables
    RUNNING = false;    % running = TRUE  if simulation is running!
                        % running = FALSE if simulation is stopped!
    default('GOL','N',1);
    default('GOL','ALIVE',1);
    default('GOL','PROB_MUTATION',1);
    default('GOL','RANDOM_GLIDERS',1);
    default('GOL','PAUSE',1);
    
    default('MG','N',1);
    default('MG','ALIVE',1);
    default('MG','PROB_MUTATION',1);
    default('MG','VISIBILITY',1);
    default('MG','MAJ_REQUIRED',1);    
    default('MG','PROB_UPDATE',1);
    
    default('CC','N',1);   
    default('CC','GROUPS',1);
    default('CC','PROB_COPY',1);
    default('CC','PROB_CONTRARIAN',1);
    default('CC','TYPE',1);
    
    default('INF','N',1);
    default('INF','INF_CELLS',1);
    
    default('WOLF','RULE',1);
    default('WOLF','INFINITYLOOP',1);
    
    ax_h = imagesc(IMAGEstart);
    title({'','',''});
    set(gca,'XTickLabel','', 'YTickLabel','')
    set(gca,'XTick',0, 'YTick',0)
    
    
    %% GOL
    % load all global handles!
        global GOLeditbox1_h;       % value: N
        global GOLeditbox2_h;       % value: ALIVE
        global GOLeditbox3_h;       % value: PROB_MUTATION
        global GOLcheckbox4_h;      % value: RANDOM_GLIDERS (checkbox)
        global GOLeditbox5_h;       % value: PAUSE
    % set all default values!
        GOLeditbox1_h.String = GOL.N;
        GOLeditbox2_h.String = sprintf('%.2f',GOL.ALIVE);
        GOLeditbox3_h.String = sprintf('%.3f',GOL.PROB_MUTATION);
        GOLcheckbox4_h.Value = GOL.RANDOM_GLIDERS;
        GOLeditbox5_h.String = GOL.PAUSE;
    
        
        
    %% MG
    % load all global handles!
        global MGeditbox1_h;        % value: N
        global MGeditbox2_h;        % value: ALIVE
        global MGeditbox3_h;        % value: PROB_MUTATION
        global MGeditbox4_h;        % value: VISIBILITY
        global MGeditbox5_h;        % value: MAJ_REQUIRED
        global MGeditbox6_h;        % value: PROB_UPDATE
    % set all default values!
        MGeditbox1_h.String = MG.N;
        MGeditbox2_h.String = MG.ALIVE;
        MGeditbox3_h.String = sprintf('%.2f',MG.PROB_MUTATION);
        MGeditbox4_h.String = MG.VISIBILITY;
        MGeditbox5_h.String = sprintf('%.2f',MG.MAJ_REQUIRED); 
        MGeditbox6_h.String = MG.PROB_UPDATE; 
    
        
        
    %% CC
    % load all global handles!
        global CCeditbox1_h;       % value: N
        global CCeditbox2_h;       % value: GROUPS
        global CCeditbox3_h;       % value: PROB_COPY
        global CCeditbox4_h;       % value: PROB_CONTRARIAN
        global CCpopupmenu5_h;     % value: TYPE (popupmenu)
    % set all default values!
        CCeditbox1_h.String  = CC.N;
        CCeditbox2_h.String  = CC.GROUPS;
        CCeditbox3_h.String  = sprintf('%.2f',CC.PROB_COPY);
        CCeditbox4_h.String  = sprintf('%.2f',CC.PROB_CONTRARIAN);
        CCpopupmenu5_h.Value = CC.TYPE;
        
        
        
    %% INF
    % load all global handles!
        global INFeditbox1_h;       % value: N
        global INFeditbox2_h;       % value: INF_CELLS
    % set all default values!
        INFeditbox1_h.String = INF.N;
        INFeditbox2_h.String = INF.INF_CELLS;
        
        
        
    %% WOLF
    % load all global handles!
        global WOLFeditbox1_h;
        global WOLFslider2_h;
        global WOLFcheckbox3_h;
    % set all default values!
        WOLFeditbox1_h.String = WOLF.RULE;
        WOLFslider2_h.Value   = WOLF.RULE;
        WOLFcheckbox3_h.Value = WOLF.INFINITYLOOP;
            

end

