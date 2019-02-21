
%%  GAME OF LIFE
%   run as script (no input needed, use of global variables!)


%% SETTINGS
% color settings
color_alive = [255/255 255/255 51/255];  	% color for cell being alive
color_dead  = [0 0 0];                      % color for cell being dead
colVec = [color_dead; color_alive];         % custom color vector

% load global variables
global GOL;
global ax_h;
global RUNNING;

global interrupted;
interrupted = 0;

    
    
%% INITIALIZATION
generation = 0;         % initialize generation count

if GOL.RANDOM_GLIDERS==true         % initialize random gliders
    g1 = [0 1 0; 0 0 1; 1 1 1];
    g2 = rot90(g1);
    g3 = rot90(g2);
    g4 = rot90(g3);

    m = zeros(GOL.N)*1;
    N_gliders = round(GOL.N/9);
    for it=1:N_gliders
       x = ceil(rand*(GOL.N-2));
       y = ceil(rand*(GOL.N-2));
       r = ceil(rand*4);
       switch r
           case 1
               m(x:x+2,y:y+2) = g1;
           case 2
               m(x:x+2,y:y+2) = g2;
           case 3
               m(x:x+2,y:y+2) = g3;
           case 4
               m(x:x+2,y:y+2) = g4;
       end
    end
else
    m = (rand(GOL.N)<GOL.ALIVE)*1;  % randomly assign states (with probability "alive")
    m = m*1;                    % convert matrix from boolean to double
end

% plot initialization
    ax_h = imagesc(m); 
    colormap(colVec);
    caxis([0 1]);
    set(gca,'XTickLabel','', 'YTickLabel','')
    set(gca,'XTick',0, 'YTick',0)
    title({'','GAME OF LIFE','generation 0'});
    drawnow;
    if GOL.RANDOM_GLIDERS==true
        pause(max(.3,GOL.PAUSE));
    else
        pause(GOL.PAUSE);
    end



%% OVER TIME
    
    stop = 0;
    while RUNNING && stop==0
        % generation count
        generation = generation +1;

        % count neighbors alive
        neighbors = zeros(GOL.N);   
        for row = 0:2
           for col = 0:2
               neighbors = neighbors + m(modulo(row:row+GOL.N-1,GOL.N),modulo(col:col+GOL.N-1,GOL.N));       
           end
        end
        neighbors = neighbors-m;

        % apply GOL ruleset!
        m_new = m;
        m_new(m==1 & (neighbors>3 | neighbors<2) ) = 0;
        m_new(m==0 & neighbors==3) = 1;
        if isequal(m,m_new) && GOL.PROB_MUTATION==0
            stop=true;
        end
        m = m_new;    

        % apply mutation if prop_mutation has a value bigger than zero
        if GOL.PROB_MUTATION>0;              
            rev = rand(GOL.N)<GOL.PROB_MUTATION;
            if sum(sum(rev))>0
                m(rev) = ~m(rev);
            end
        end


        % plot
        ax_h = imagesc(m);
        caxis([0 1]);
        set(gca,'XTickLabel','', 'YTickLabel','')
        set(gca,'XTick',0, 'YTick',0)
        title({'','GAME OF LIFE',['generation ', num2str(generation)]});
        drawnow;
        pause(GOL.PAUSE);
    end
    
    if stop
        title({'','GAME OF LIFE',['covergence at generation ', num2str(generation)]});
    else
        title({'','GAME OF LIFE',['stopped after generation ', num2str(generation)]});
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
    
    