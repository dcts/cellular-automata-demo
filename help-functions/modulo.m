function [ result ] = modulo( x, N )
%MODULO FUNCTION: own version!
%   generates a series from 1 to N and skips the 0!
%   Example: N=4    |   x=-1    > 3
%                   |   x=0     > 4
%                   |   x=1     > 1
%                   |   x=2     > 2
%                   |   x=3     > 3
%                   |   x=4     > 4
%                   |   x=5     > 1
%                   |   x=6     > 2
%                   |   x=7     > 3
%                   |   x=8     > 4
    
result = mod(x-1,N)+1;
end
