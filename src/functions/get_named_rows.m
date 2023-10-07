function [outputStruct] = get_named_rows(bells,nvPairs,row)

% [namedRows] = get_named_rows(bells,options)
% 
% Function to get the named rows of call changes from a given number of bells.
% Include/exclude filter using string array optional inputs.
% 
% OJH - 14/11/2022

%% Inputs
arguments
    bells (1,1) double {mustBePositive} = 6;
    nvPairs.Mode (1,1) string = "Exclusive";
    row.Rounds (1,1) logical = false;
    row.Queens (1,1) logical = false;
    row.Kings (1,1) logical = false;
    row.Tittums (1,1) logical = false;
    row.ReverseTittums (1,1) logical = false;
    row.BackRounds (1,1) logical = false;
    row.Jacks (1,1) logical = false;
    row.Jokers (1,1) logical = false;
    row.SeeSaw (1,1) logical = false;
    row.Kennet (1,1) logical = false;
    row.Princes (1,1) logical = false;
    row.ExplodingTittums (1,1) logical = false;
    row.Burdette (1,1) logical = false;
    row.Hagdyke (1,1) logical = false;
    row.ExplodingHagdyke (1,1) logical = false;
    row.Princesses (1,1) logical = false;
    row.Whittingtons (1,1) logical = false;
    row.Priory (1,1) logical = false;
    row.RollerCoaster (1,1) logical = false;
end

if isequal(nvPairs.Mode, "Inclusive")
    fnames = fieldnames(row);
    for a = 1:length(fnames)
        row.(fnames{a}) = true;%~options.(fnames{a});
    end
end

if mod(bells,2) == 1
    bells = bells+1;
    remove_tenor = true;
else
    remove_tenor = false;
end

%% Define row functions
func.Rounds = @(x) 1:x;
func.BackRounds = @(x) [x-1:-1:1 x];
func.Queens = @(x) [1:2:x 2:2:x]; % Up the odds, up the evens
func.Princesses = @(x) swapcol(func.Queens(x), x/2, x/2+1); % Queens but swap the middle pair
func.Kings = @(x) [x-1:-2:1 2:2:x]; % Down the odds, up the evens
func.Tittums = @(x) reshape(reshape(1:x, [], 2)', 1, []);
func.ReverseTittums = @(x) circshift(reshape(reshape(x:-1:1, [], 2)', 1, []), -1);
func.ExplodingTittums = @(x) reshape(flipudc(reshape(1:x, [], 2), 1)', 1, []);
func.Jacks = @(x) [1 reshape([x-2:-2:2;x-1:-2:2],1,[]) x];
func.Jokers = @(x) [1 fliplr(2:x-1) x];
func.SeeSaw = @(x) [fliplr(1:x/2) 1+(x/2):x];
func.Kennet = @(x) [1 reshape(circshift(reshape(fliplr(reshape(reshape(2:x-1, 2, [])', 1 ,[])), [], 2)', -((x-2)/2)+2, 2)', 1, []) x]; % TODO Check > 8
func.Princes = @(x) swapcol(func.Kings(x), x/2, x/2+1); % Kings but swap the middle pair
func.Burdette = @(x) burdetteHelper(x);
func.Hagdyke = @(x) hagdykeHelper(x);
func.ExplodingHagdyke = @(x) hagdykeHelper(x, true);
func.Whittingtons = @(x) whittingtonsHelper(x);
func.Priory = @(x) [1 reshape(flipud(reshape(2:x-1, 2, [])), 1, []) x];
func.RollerCoaster = @(x) rollerCoasterHelper(x);

%% Create output struct
fnames = fieldnames(row);
row = reshape(horzcat([fnames(structfun(@(x) x, row)), cellfun(@(x) func.(x)(bells),...
    fnames(structfun(@(x) x, row)), 'Uni', 0)])',1,[]);
outputStruct = struct(row{:});

if remove_tenor
    outputStruct = structfun(@(x) x(1:end-1), outputStruct, 'uni', 0);
end

%% Local functions.

    function t = whittingtonsHelper(x)
        if mod(x,6) == 0
            t = func.Kings(6);
            for i = 1:(x/6)-1
                t = horzcat([t func.Kings(6)+6*i]);
            end
        else
            t = unique([1:mod(x,6) func.Kings(x)], 'stable');
        end
    end

    function t = hagdykeHelper(x,isExploding)

        if nargin < 2 || isempty(isExploding)
            isExploding = false;
        end

        t = reshape(1:x,2,[]);
        for i = size(t,2)-1:-2:2
            t = swapcol(t, i, i-1);
        end

        if isExploding
            for i = size(t,2)-1:-2:3
                t = swapcol(t, i, i-2);
            end
            for i = 1:2:size(t,2)-1
                t = flipudc(t, i);
            end
        end

        t = reshape(t, 1, []);
    end

    function t = rollerCoasterHelper(x)
        t = 1:x;
        switch mod(x,3)
            case {0 1}
                n = 1:3:x-mod(x,3);
            case 2
                n = 2:3:x-mod(x,3);
        end
        for i = n
            t(i:i+2) = fliplr(t(i:i+2));
        end
    end

    function t = burdetteHelper(x)
        t = 1:x;
        switch mod(x,3)
            case 0
                for i = 1:3:x
                    t = swapcol(t, i, i+1);
                end
            otherwise
                for i = 1:x/2:x
                    t(i:i+2) = circshift(t(i:i+2), 1, 2);
                end
        end
    end

%% END.
end