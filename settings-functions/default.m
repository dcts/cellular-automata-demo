function [output] = default(str,str2,bool)
    
    % DEFINE DEFAULT VALUES FOR ALL SETTINGS !
    GOLd.N               = 250;
    GOLd.ALIVE           = 0.1;
    GOLd.PROB_MUTATION   = 0;
    GOLd.RANDOM_GLIDERS  = false;
    GOLd.PAUSE           = 0;
    
    MGd.N                = 250;
    MGd.ALIVE            = 0.5;
    MGd.PROB_MUTATION    = 0.0;
    MGd.VISIBILITY       = 2;
    MGd.MAJ_REQUIRED     = 0.5;    
    MGd.PROB_UPDATE      = 1;
    
    CCd.N               = 250;     
    CCd.GROUPS          = 5;
    CCd.PROB_COPY       = 0.2;
    CCd.PROB_CONTRARIAN = 0;
    CCd.TYPE            = 1;    % 1: equally
                                % 2: domination
    INFd.N           = 350;
    INFd.INF_CELLS   = 10;
    
    WOLFd.RULE         = 161;
    WOLFd.INFINITYLOOP = false;
    
    % load global variables
    global GOL
    global MG
    global CC
    global INF
    global WOLF
    
    switch str
        case 'GOL'
            switch str2
                case 'N'
                    output = GOLd.N;
                    if bool
                        GOL.N = output;
                    end
                case 'ALIVE'
                    output = GOLd.ALIVE;  
                    if bool
                        GOL.ALIVE = output;
                    end
                case 'PROB_MUTATION'
                    output = GOLd.PROB_MUTATION;
                    if bool
                        GOL.PROB_MUTATION = output;
                    end
                case 'RANDOM_GLIDERS'
                    output = GOLd.RANDOM_GLIDERS;
                    if bool
                        GOL.RANDOM_GLIDERS = output;
                    end
                case 'PAUSE'
                    output = GOLd.PAUSE;
                    if bool
                        GOL.PAUSE = output;
                    end
                otherwise
                    disp('error in getDefault-function! 2nd input is not valid!');
            end

        case 'MG'
            switch str2
                case 'N'
                    output = MGd.N;
                    if bool
                        MG.N = output;
                    end
                case 'ALIVE'
                    output = MGd.ALIVE;
                    if bool
                        MG.ALIVE = output;
                    end
                case 'PROB_MUTATION'
                    output = MGd.PROB_MUTATION;
                    if bool
                        MG.PROB_MUTATION = output;
                    end
                case 'VISIBILITY'
                    output = MGd.VISIBILITY;
                    if bool
                        MG.VISIBILITY = output;
                    end
                case 'MAJ_REQUIRED'
                    output = MGd.MAJ_REQUIRED;
                    if bool
                        MG.MAJ_REQUIRED = output;
                    end
                case 'PROB_UPDATE'
                    output = MGd.PROB_UPDATE;
                    if bool
                        MG.PROB_UPDATE = output;
                    end
                otherwise
                    disp('error in getDefault-function! 2nd input is not valid!');
            end
            
        case 'CC'
            switch str2
                case 'N'
                    output = CCd.N;
                    if bool
                        CC.N = output;
                    end                    
                case 'GROUPS'
                    output = CCd.GROUPS;
                    if bool
                        CC.GROUPS = output;
                    end                    
                case 'PROB_COPY'
                    output = CCd.PROB_COPY;
                    if bool
                        CC.PROB_COPY = output;
                    end
                case 'PROB_CONTRARIAN'
                    output = CCd.PROB_CONTRARIAN;
                    if bool
                        CC.PROB_CONTRARIAN = output;
                    end
                case 'TYPE'
                    output = CCd.TYPE;
                    if bool
                        CC.TYPE = output;
                    end
                otherwise
                    disp('error in getDefault-function! 2nd input is not valid!');
            end
            
        case 'INF'
            switch str2
                case 'N'
                    output = INFd.N;
                    if bool
                        INF.N= output;
                    end
                case 'INF_CELLS'
                    output = INFd.INF_CELLS;
                    if bool
                        INF.INF_CELLS = output;
                    end
                otherwise
                    disp('error in getDefault-function! 2nd input is not valid!');
            end
            
        case 'WOLF'
            switch str2
                case 'RULE'
                    output = WOLFd.RULE;
                    if bool
                        WOLF.RULE = output;
                    end
                case 'INFINITYLOOP'
                    output = WOLFd.INFINITYLOOP;
                    if bool
                        WOLF.INFINITYLOOP = output;
                    end
                otherwise
                    disp('error in getDefault-function! 2nd input is not valid!');
            end
            
        otherwise
            disp('error in getDefault-function! 1st input is not valid!');
    end
    
end