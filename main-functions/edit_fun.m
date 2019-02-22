function edit_fun(obj,~)
%editbox function: if an editbox, checkbox or popupmenu in the settings is 
%  changed, this function sets running to 0 (which stops the computation!)
    
    % get global variables
    global RUNNING;
    global GOL;
    global MG;
    global CC;
    global INF;
    global WOLF;
    global buttonStart_h;
    global GOLeditbox2_h;
    global WOLFslider2_h;
    global WOLFeditbox1_h;
    global WOLFeditbox4_h;
                
    % stop computation if currently running
    running = RUNNING;
    if RUNNING==1       
        RUNNING = 0;                    % stop computation 
        buttonStart_h.String = 'START'; % change button label to "start"
    end
    
    setNA = 0;
    done = 0;
    switch obj.Tag 
        % GOL -------------------------------------------------------------
        case 'GOL.N'
            if isnan(str2double(obj.String))
                done = repair();
            else
                x = trimm(10,450,1);
                GOL.N = x;
            end
            
        case 'GOL.ALIVE'
            if isnan(str2double(obj.String))
                done = repair();
            else
                if GOL.RANDOM_GLIDERS == 0
                    x = trimm(0,1,0);
                    GOL.ALIVE = x;
                else
                    setNA = 1;
                end
            end
            
        case 'GOL.PROB_MUTATION'
            if isnan(str2double(obj.String))
                done = repair();
            else
                x = trimm(0,1,0);
                GOL.PROB_MUTATION = x;
            end
            
        case 'GOL.RANDOM_GLIDERS'
            GOL.RANDOM_GLIDERS = obj.Value;
            if obj.Value
                GOLeditbox2_h.String = 'NA';
            else
                GOLeditbox2_h.String = num2str(GOL.ALIVE);
            end
            
        case 'GOL.PAUSE'
            if isnan(str2double(obj.String))
                done = repair();
            else
                x = trimm(0,1,0);
                GOL.PAUSE = x;
            end
            
        % MG --------------------------------------------------------------
        case 'MG.N'    
            if isnan(str2double(obj.String))
                done = repair();
            else
                x = trimm(10,350,1);
                MG.N = x;
            end
            
        case 'MG.ALIVE'
            if isnan(str2double(obj.String))
                done = repair();
            else
                x = trimm(0,1,0);
                MG.ALIVE = x;
            end       
            
        case 'MG.PROB_MUTATION'
            if isnan(str2double(obj.String))
                done = repair();
            else
                x = trimm(0,1,0);
                MG.PROB_MUTATION = x;
            end
            
        case 'MG.VISIBILITY'
            if isnan(str2double(obj.String))
                done = repair();
            else
                x = trimm(1,5,1);
                MG.VISIBILITY = x;
            end       
            
        case 'MG.MAJ_REQUIRED'
            if isnan(str2double(obj.String))
                done = repair();
            else
                x = trimm(0,1,0);
                MG.MAJ_REQUIRED = x;
            end
            
        case 'MG.PROB_UPDATE'
            if isnan(str2double(obj.String))
                done = repair();
            else
                x = trimm(0,1,0);
                MG.PROB_UPDATE = x;
            end
            
        % CC --------------------------------------------------------------
        case 'CC.N'    
            if isnan(str2double(obj.String))
                done = repair();
            else
                x = trimm(10,350,1);
                CC.N = x;
            end
            
        case 'CC.GROUPS'
            if isnan(str2double(obj.String))
                done = repair();
            else
                x = trimm(2,12,1);
                CC.GROUPS = x;
            end
            
        case 'CC.PROB_COPY'    
            if isnan(str2double(obj.String))
                done = repair();
            else
                x = trimm(0,1,0);
                CC.PROB_COPY = x;
            end  
            
        case 'CC.PROB_CONTRARIAN'    
            if isnan(str2double(obj.String))
                done = repair();
            else
                x = trimm(0,1,0);
                CC.PROB_CONTRARIAN = x;
            end  
            
        case 'CC.TYPE'
            if obj.Value==1
                CC.TYPE = 1;
                done=1;
            elseif obj.Value==2
                CC.TYPE = 2;
                done=1;
            end
            
            
        % INF -------------------------------------------------------------
        case 'INF.N'    
            if isnan(str2double(obj.String))
                done = repair();
            else
                x = trimm(10,450,1);
                INF.N = x;
            end
        case 'INF.INF_CELLS'
            if isnan(str2double(obj.String))
                done = repair();
            else
                x = trimm(1,100,1);
                INF.INF_CELLS = x;
            end
        
            
        % WOLF ------------------------------------------------------------
        case 'WOLF.RULE'    
            if isnan(str2double(obj.String))
                done = repair();
            else
                x = trimm(0,255,1);
                WOLF.RULE = x;
                WOLFslider2_h.Value = WOLF.RULE;
                if WOLF.INFINITYLOOP == 0
                    start_fun;
                end
            end
            
        case 'WOLF.RULE_SLIDER'
            WOLFslider2_h.Value = round(WOLFslider2_h.Value);
            WOLFeditbox1_h.String = num2str(WOLFslider2_h.Value);
            WOLF.RULE = WOLFslider2_h.Value;
            done = 1;
            if WOLF.INFINITYLOOP == 0
                start_fun;
            end
            
        case 'WOLF.INFINITYLOOP'
            WOLF.INFINITYLOOP = obj.Value;
            if WOLF.INFINITYLOOP == 1
                buttonStart_h.Visible = 'on';
                WOLF.RENDERSPEED = 4;
                WOLFeditbox4_h.String = num2str(WOLF.RENDERSPEED);
            else
                buttonStart_h.Visible = 'off';
                WOLF.RENDERSPEED = 'NA';
                WOLFeditbox4_h.String = WOLF.RENDERSPEED;
                if running == 0
                    start_fun;
                end
            end
            
        case 'WOLF.RENDERSPEED'
            if isnan(str2double(obj.String))
                done = repair();
            else
                if WOLF.INFINITYLOOP == 1
                    x = trimm(1,200,1);
                    WOLF.RENDERSPEED = x;
                else
                    setNA = 1;
                end
            end
            
        otherwise
            error('check editbox_fun / editbox.Tags !!!');
    end
    
    % assign new value
    if ~isempty(obj.String)    % editbox was changed
        if setNA == 1
            obj.String = 'NA';
        else 
            if done==0
                obj.String = num2str(x); % editbox
            end
        end
    end
    

    
    %% REPAIR
    function [done] = repair()
        STR  = strsplit(obj.Tag, '.');
        str  = char(STR(1));
        str2 = char(STR(2));
        obj.String = num2str(default(str,str2,1));
        done = 1;
    end


    %% TRIMM
    function [x] = trimm(MIN, MAX, bool)
        x = str2double(obj.String);
        if bool
            x = round(x);
        end
        x = max(min(x,MAX),MIN);
    end
    
end









