
%%  MAJORITY GAME
%   run as script (no input needed, use of global variables!)


%% SETTINGS
% colors
color_alive = [255/255 255/255 51/255];  	% color for cell being alive
color_dead  = [0 0 0];                      % color for cell being dead
colVec      = [color_dead; color_alive];    % custom color vector

% load global variables
global MG;
global ax_h;
global RUNNING;
global buttonStart_h;

global interrupted;
interrupted = 0;



%% INITIALIZATION
generation = 0;
m = rand(MG.N)<MG.ALIVE;

    % plot
    ax_h = imagesc(m); 
    colormap(colVec)
    caxis([0 1]);
    set(gca,'XTickLabel','', 'YTickLabel','')
    set(gca,'XTick',0, 'YTick',0)
    title({'','MAJORITY GAME',['generation ', num2str(generation)]});
    drawnow;

% initialize TotN and ReqN ("total" and "required" neighbors)
TotN = (1+MG.VISIBILITY*2)^2;       % total neighbors
ReqN = TotN*MG.MAJ_REQUIRED;        % required amount of neighbors for cell to stay...
                                    % ...at same state (has NOT to be an integer)!  
range = 2*MG.VISIBILITY+1;                       



%% OVER TIME
    
    stop = false;
    while RUNNING
        generation = generation +1;     % generation count

        % generate extended (bigger) matrix: m_ex => (N+2vis x N+2vis)-matrix
        index_vec = modulo(1-MG.VISIBILITY:MG.N+MG.VISIBILITY , MG.N);
        m_ex = m(index_vec, index_vec);

        % count neighbors (moore neighborhood)
        % count neighbors alive (1)
        neighbor_1 = zeros(MG.N);          
        for row = 1:range
           for col = 1:range
               neighbor_1 = neighbor_1 + m_ex(row:row+MG.N-1, col:col+MG.N-1);
           end
        end
        % count neighbors dead (0)
        neighbor_0 = TotN - neighbor_1; 

        % transform to new matrix
        update = rand(MG.N)<MG.PROB_UPDATE;
        m_new = m;
        m_new(m==1 & neighbor_1<floor(ReqN)) = 0;
        m_new(m==0 & neighbor_0<floor(ReqN)) = 1;
        if isequal(m,m_new) && MG.PROB_MUTATION==0
            stop=true;
        end
        m(update) = m_new(update);

        % do mutation (only for valid MG.PROB_MUTATION values)
        % (bigger than 0, non negative values allowed)
        if MG.PROB_MUTATION>0;              
            rev = rand(MG.N)<MG.PROB_MUTATION;
            if sum(sum(rev))>0
                m(rev) = ~m(rev);
            end
        else
            
        end

        % plot
        ax_h = imagesc(m); 
        colormap(colVec)
        caxis([0 1]);
        set(gca,'XTickLabel','', 'YTickLabel','')
        set(gca,'XTick',0, 'YTick',0)
        title({'','MAJORITY GAME',['generation ', num2str(generation)]});
        drawnow;
        
        if stop
           break; 
        end
    end

    % ending title
    if stop
        title({'','MAJORITY GAME',['convergence at generation ', num2str(generation)]});
    else
        title({'','MAJORITY GAME',['stopped after generation ', num2str(generation)]});
    end
    buttonStart_h.String = 'START';
    RUNNING = 0;  

    
    % if popupmenu was clicked while simulation running, reset!
    global IMAGEstart;
    if interrupted == 1
        ax_h = imagesc(IMAGEstart);
        title({'','',''});
        set(gca,'XTickLabel','', 'YTickLabel','')
        set(gca,'XTick',0, 'YTick',0)
    end
    
    
    