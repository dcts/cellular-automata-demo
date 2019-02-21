
%%  COPY CAT
%   run as script (no input needed, use of global variables!)


%% SETTINGS
% color settings
c1  = [      0       0       0];    %  1: black
c2  = [ 16/255 239/255 239/255];    %  2: türkis
c3  = [      0 143/255       1];    %  3: light blue
c4  = [      0  16/255       1];    %  4: blue
c5  = [      0       0 143/255];    %  5: dark blue
c6  = [ 75/255       0 130/255];    %  6: purple
c7  = [128/255       0       0];    %  7: brown
c8  = [239/255       0       0];    %  8: red
c9  = [      1 112/255       0];    %  9: orange
c10 = [      1 204/255       0];    % 10: light orange
c11 = [255/255 239/255   0/255];    % 11: yellow
c12 = [      1       1 204/255];    % 12: light yellow
colorMat = [c1;c2;c3;c4;c5;c6;c7;c8;c9;c10;c11;c12];

% load global variables
global ax_h;
global CC;
global RUNNING;

global interrupted;
interrupted = 0;

% save parameters from global variables
N      = CC.N;                      % number of cells each row and column
k      = CC.GROUPS;                 % number of groups (min:2, max:12)
p_copy = CC.PROB_COPY;              % probability of cell copying a randomly choosen cell
contrarian = CC.PROB_CONTRARIAN;    % contrarian
pause_init = 0;                     % pause after initialization
domination = CC.TYPE-1;             % 0: equally distributed
                                    % 1: domination mode on (black group has 50% of...
                                    % ...territory after initialization)
domination_factor = 0.8;            % 1:    only black group
                                    % 0.8:	black group has 80% of all terretory!

                            
                            
%% INITIALIZATION

if domination == 0      % equally distributed initialization
    m = ceil(rand(N)*k);    % randomly assigne states / groups
elseif domination == 1  % domination mode active
    m = zeros(N);
    yy = domination_factor;     % percentage of dominator group
    xx = (1-yy)/(k-1);          % precentage of dominated groups
    
    prob_vec      = zeros(k,1);
    prob_vec(1)   = yy;
    prob_vec(2:k) = xx;
    prob_sum = cumsum(prob_vec);
    
    % random assignment
    r = rand(N);
    done = zeros(N);
    for i=1:k
        m(r<prob_sum(i) & done==0) = i;
        done(r<prob_sum(i)) = 1;
    end
    
else 
    disp('VALUE FOR "domination" is wrong! please correct!');
end

generation = 0;         % initialize generation count
groups = 1:k;

    % plot
    ax_h = imagesc(m); 
    title({'','COPY CAT',['generation ', num2str(generation)]});
    set(gca,'XTickLabel','', 'YTickLabel',''); 
    set(gca,'XTick',0, 'YTick',0);
    colormap(colorMat); 
    caxis([1 12])
    drawnow;
    pause(pause_init);


    
    
%% OVER TIME

    while RUNNING
        generation = generation+1;
        ch = rand(N) < p_copy;      % change matrix (indicates which cell we want to change) 
        chN = sum(ch(:));           % number of elements to change
        ch = ch*1;                  % change boolean to double (change type)
        
        chIND = randsample([1:4,6:9],chN,1);
        ch(ch==1) = chIND;

        m_new = m;
        for row=1:N
            for col=1:N
                if ch(row,col) ~= 0
                    x = modulo(ch(row,col),3)-2;
                    y = ceil(ch(row,col)/3)-2;
                    target = m(modulo(row+y,N), modulo(col+x,N)); 
                    if rand < contrarian
                        m_new(row,col) = randsample(groups(groups~=target),1);
                    else 
                        m_new(row,col) = target; 
                    end
                end       
            end
        end
        m = m_new;

        % plot
        ax_h = imagesc(m); 
        title({'','COPY CAT',['generation ', num2str(generation)]});
        set(gca,'XTickLabel','', 'YTickLabel',''); 
        set(gca,'XTick',0, 'YTick',0);
        colormap(colorMat); 
        caxis([1 12])
        drawnow;
    end
    
    % plot ending title
    title({'','COPY CAT',['stopped at generation ', num2str(generation)]});
    
    % if popupmenu was clicked while simulation running, reset!
    global IMAGEstart;
    if interrupted == 1
        ax_h = imagesc(IMAGEstart);
        title({'','',''});
        set(gca,'XTickLabel','', 'YTickLabel','')
        set(gca,'XTick',0, 'YTick',0)
    end
    
    