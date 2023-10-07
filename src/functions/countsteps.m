function [count,steps] = countsteps(a,b)

% [result,steps] = countsteps(s1,s2)
% 
% Function to find the minimum number of steps required to get from a to b
% by swapping adjacent pairs.
% 
% OJH - 18/03/2022

arguments
    a (1,:) {mustBeA(a,["string","double"]), mustBeVector(a)}
    b (1,:) {mustBeA(b,["string","double"]), mustBeVector(b)}
end

steps{1,:} = a;

i = 1;
count = 0;

while i < size(a,2) + 1
    j = find(ismember(a,b(i)));
    while i < j
        a(j-1:j) = a([j j-1]); % Swap pair
        j = j-1;
        count = count + 1;
        steps{count+1,:} = a;
    end
    i = i + 1;
end

% Respect input type
if isnumeric(b)
    steps = cell2mat(steps);
elseif isstring(b)
    steps = vertcat(steps{:});
end

end

