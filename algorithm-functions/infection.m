
%%  INFECTION
%   run as script (no input needed, use of global variables!)


%% SETTINGS
% colors
c1 = [128/255 0 0];     % infected cell: red
c2 = [1 1 1];           % healthy cell: white
colVec = [c2; c1];      % custom color vector

% load global variables
global INF;
global ax_h;
global RUNNING
global buttonStart_h;

global interrupted;
interrupted = 0;


% save parameters from global variables
N        = INF.N;           % number of cells in each row and column
infected = INF.INF_CELLS;   % number of infected cells at initialization
p_inf    = .05;     % probability of passing on the infection
p_init   = 0.0;     % pause after initialization
p        = 0.00;    % pause after each iteration
prob_mut = 0.000;   % probability of a random infection
prob_up  = 1.0;     % probability of updating
    
    
%% INITIALIZATION
generation = 0;     
m = zeros(N);

x_inf = datasample(1:N,infected);
y_inf = datasample(1:N,infected);
for it=1:infected
    m(x_inf(it),y_inf(it)) = 1;
end

    % plot
    ax_h = imagesc(m); 
    colormap(colVec);
    caxis([0 1])
    set(gca,'XTickLabel','', 'YTickLabel','')
    set(gca,'XTick',0, 'YTick',0)
    title({'','INFECTION',['generation ', num2str(generation)]});
    drawnow;
    pause(p_init);

    


%% OVER TIME
    
    stop = 0;
    while RUNNING        
        if sum(m(:))==N^2
            stop = 1;
            break;
        end
        
        generation = generation +1;

        % count number of infected cells for each cell
        neighbors = zeros(N);   
        for row = 0:2
           for col = 0:2
               neighbors = neighbors + m(modulo(row:row+N-1,N),modulo(col:col+N-1,N));       
           end
        end
        neighbors = neighbors-m;
        prob = m;
        prob(m==0) = 1-(1-p_inf).^(neighbors(m==0));
        %prob(m==0) = (p_inf).*(neighbors(m==0));
        m2 = (rand(N) < prob)*1;
        update = rand(N)<prob_up;
        m(update) = m2(update);

        % mutation
        mutation = rand(N) < prob_mut;
        m(mutation) = 1;
        
        % plot
        ax_h = imagesc(m);
        set(gca,'XTickLabel','', 'YTickLabel','')
        set(gca,'XTick',0, 'YTick',0)
        title({'','INFECTION',['generation ', num2str(generation)]});
        drawnow;
        pause(p);
    end
    % display ending title
    if stop
        title({'','INFECTION',['fully infected at generation ', num2str(generation)]});
    else
        title({'','INFECTION',['stopped after generation ', num2str(generation)]});
    end
    buttonStart_h.String = 'START';
    RUNNING = 0;
    
    % if popupmenu was clicked while simulation running, reset!
    global IMAGEstart;
    if interrupted == 1;
        ax_h = imagesc(IMAGEstart);
        title({'','',''});
        set(gca,'XTickLabel','', 'YTickLabel','')
        set(gca,'XTick',0, 'YTick',0)
    end
    
    
