function [ result ] = getExplanationText( str )
%returnText FUNCTION: returns the text of the "explain" panel as String
    switch str
        case char('GOL')
            s = {...
            'N: number of cells each row and column. Has to be an integer between [10,450]. Choosing low values combined with PAUSE=1 can give an insight of whats happening in each generation.',...
            '',...
            'ALIVE: percentage of living cells at initialization. Has to be a value between [0,1], but too low or too high values lead to fast extinction! Is ignored when RANDOM_GLIDERS is on.',...
            '',...
            'PROB_MUTATION: describes the probability, with which a cell is doing the opposite of what the GOL-ruleset would implement. Has to be between [0,1], although its recommended to use values only smaller than 0.02 (try 0.001 for the beginning).',...
            '',...
            'RANDOM_GLIDERS: is randomly initializing a couple of �gliders�, which demonstrates one of the most common GOL-Patterns. Also try using this option with a PROB_MUTATION of 0.001 and you�ll see how life can be generated with simply adding random mutation.',...
            '',...
            'PAUSE: amount of seconds each frame is displayed. Has to be between [0,1]. Set 0.5 if you want to observe each frame for half a second, set 0 for smoother visual experience.',...
            };  
        case char('MG')
            s = {...
            'N: number of cells each row and column. Has to be an integer value between [10,350].',...
            '',...
            'ALIVE: percentage of living cells at initialization. Has to be a value between [0,1].',...
            '',...
            'PROB_MUTATION: describes the probability of a cell doing the opposite of what the MAJORITY-ruleset would implement. Has to be between [0,1], although its recommended to use small values only (try 0.01).',...
            '',...
            'VISIBILITY: how far can each cell "see"? High values are extending the neighborhood-definition of each cell ("Moore-neighborhood is used). Has to be an integer value between [1,5].',...
            '',...
            'MAJ_REQUIRED: what percentage of cells in same state is needed for a cell to be happy. Has to be a value between [0,1].',...
            '',...
            'PROB_UPDATE: how many cells are (randomly) updating each iteration? Has to be a value between [0,1]',...
            };  
        case char('CC')
            s = {...
            'Each cell can have multiple states (multiple groups). Each generation, the cells switch to the state of a randomly choosen neighbor!',...
            '',...
            'N: number of cells each row and column. Has to be an integer value between [10,350].',...
            '',...
            'GROUPS: defines how many different states each cell can have. Has to be an integer value between [2,12].',...
            '',...
            'PROB_COPY: describes the probability of a cell randomly copying a neighboring cell. Has to be a value between [0,1]. High values lead to faster movement.',...
            '',...
            'PROB_CONTRARIAN: probability with which a copying cell choose not the group of the choosen neighbor, but choose from the subset of all groups except the group of the choosen neighbor! Has to be a value between [0,1].',...
            '',...
            'TYPE: determines how the different states are initialized! If "domination" is choosen, the first group (black) is dominating the other groups!',...
            };  
        case char('INF')
            s = {...
            'INFECTION is a cellular automata in which each cell can have one of two different states: "infected" or "healthy". Each cell can pass on the infection to its neighboring cells with a very small probability. The more infected neighbors a healthy cell has, the more likely it is that the infection is spread.',...
            '',...
            'N: number of cells each row and column. Has to be an integer value between [10,450].',...
            '',...
            'INF_CELLS: defines the number of cells that are infected at initialization. Has to be an integer value between [1,100].',...
            };  
        case char('WOLF')
            s = {...
            'WOLFRAMS ELEMENTARY CELLULAR AUTOMATA is the simplest class of one-dimensional cellular automata. Each cell can have 2 states (0 or 1) and has totally 2 neighbors. The own state and the state of both neighors determine the state in the next period! There are exactely 256 different rulesets, wchich are all covered in this demonstration.',...
            '',...
            'RULE: Which Wolfram ruleset has to be applied? Has to be an integer value between [0,255].',...
            '',...
            'INFINITYLOOP: If switched on, the visualization will be updated continiously and without an end.',...
            };  
    end
        

	result = s;
end

