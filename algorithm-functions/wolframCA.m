

%% WOLFRAMS 1D CELLULAR AUTOMATA

% load global variables
global RUNNING;
global WOLF
global ax_h;
global buttonStart_h;
global interrupted;
interrupted = 0;

% SETTINGS
N                   = 200;
rand_initialization = 0;
alive               = 0.01;

% colors
color_alive = [0 0 0];                      % color for cell being alive
color_dead  = [1 1 1];                      % color for cell being dead
colVec      = [color_dead; color_alive];    % custom color vector

RULE_AT_START = WOLF.RULE;

%% INITIALIZATION
% initialize matrix!
if rand_initialization == 1
    m      = zeros(N)*1;
    m(1,:) = rand(1,N) < alive;
elseif rand_initialization == 0
    m        = zeros(N)*1;
    mid      = round(N/2);
    m(1,mid) = 1;
else
    disp('ERROR: check value for rand_initialization!!!');
end

% get rule
rule = dec2bin(WOLF.RULE,8);
r1   = str2double(rule(1));
r2   = str2double(rule(2));
r3   = str2double(rule(3));
r4   = str2double(rule(4));
r5   = str2double(rule(5));
r6   = str2double(rule(6));
r7   = str2double(rule(7));
r8   = str2double(rule(8));
i = 1;



%% OVER TIME

    if WOLF.INFINITYLOOP == 1
        generation = 0;
        while RUNNING
            generation = generation + 1;
            i = i+1;
            pattern =           m(i-1, modulo(0:N-1 ,N))*100;
            pattern = pattern + m(i-1, modulo(1:N   ,N))*10;
            pattern = pattern + m(i-1, modulo(2:N+1 ,N))*1;

            line = zeros(1,N)*1;
            line(pattern==111) = r1;
            line(pattern==110) = r2;
            line(pattern==101) = r3;
            line(pattern==100) = r4;
            line(pattern== 11) = r5;
            line(pattern== 10) = r6;
            line(pattern==  1) = r7;
            line(pattern==  0) = r8;

            m(i,:) = line;
            
            if (generation>=N && mod(generation, WOLF.RENDERSPEED)==0) 
                ax_h = imagesc(m);
                colormap(colVec)
                caxis([0 1]);
                set(gca,'XTickLabel','', 'YTickLabel','')
                set(gca,'XTick',0, 'YTick',0)
                title({'','WOLFRAMS CELLULAR AUTOMATA',['rule ', num2str(WOLF.RULE)]});
                drawnow;
            end
            if i==N
                i=i-1;
                m = [m(2:end, :);zeros(1,N)];
            end
        end
        title({'','WOLFRAMS CELLULAR AUTOMATA',['STOPPED! (rule ', num2str(RULE_AT_START),')']});
        

    elseif WOLF.INFINITYLOOP == 0
        for it=2:N
            i = i+1;
            pattern =           m(i-1, modulo(0:N-1 ,N))*100;
            pattern = pattern + m(i-1, modulo(1:N   ,N))*10;
            pattern = pattern + m(i-1, modulo(2:N+1 ,N))*1;

            line = zeros(1,N)*1;
            line(pattern==111) = r1;
            line(pattern==110) = r2;
            line(pattern==101) = r3;
            line(pattern==100) = r4;
            line(pattern== 11) = r5;
            line(pattern== 10) = r6;
            line(pattern==  1) = r7;
            line(pattern==  0) = r8;

            m(i,:) = line;
        end
        ax_h = imagesc(m);
        colormap(colVec)
        caxis([0 1]);
        set(gca,'XTickLabel','', 'YTickLabel','')
        set(gca,'XTick',0, 'YTick',0)
        title({'','WOLFRAMS CELLULAR AUTOMATA',['rule ', num2str(WOLF.RULE)]});
        drawnow;
    end
    buttonStart_h.String = 'START';
    RUNNING = 0; 

    global IMAGEstart;
    if interrupted == 1
        ax_h = imagesc(IMAGEstart);
        title({'','',''});
        set(gca,'XTickLabel','', 'YTickLabel','')
        set(gca,'XTick',0, 'YTick',0)
    end
