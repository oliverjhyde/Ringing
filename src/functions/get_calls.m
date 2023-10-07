function [line,order,placenotation] = get_calls(bells, nvPairs, named_rows)
%% Inputs
arguments
    bells (1,1) double {mustBeLessThanOrEqual(bells,12), mustBeGreaterThan(bells,3)} = 6;
    nvPairs.Mode (1,1) string = "Exclusive";
    named_rows.Rounds (1,1) logical = true;
    named_rows.Queens (1,1) logical = false;
    named_rows.Kings (1,1) logical = false;
    named_rows.Tittums (1,1) logical = false;
    named_rows.ReverseTittums (1,1) logical = false;
    named_rows.BackRounds (1,1) logical = false;
    named_rows.Jacks (1,1) logical = false;
    named_rows.Jokers (1,1) logical = false;
    named_rows.SeeSaw (1,1) logical = false;
    named_rows.Kennet (1,1) logical = false;
    named_rows.Princes (1,1) logical = false;
    named_rows.ExplodingTittums (1,1) logical = false;
    named_rows.Burdette (1,1) logical = false;
    named_rows.Hagdyke (1,1) logical = false;
    named_rows.ExplodingHagdyke (1,1) logical = false;
    named_rows.Princesses (1,1) logical = false;
    named_rows.Whittingtons (1,1) logical = false;
    named_rows.Priory (1,1) logical = false;
    named_rows.RollerCoaster (1,1) logical = false;
end

if isequal(nvPairs.Mode, "Inclusive")
    fnames = fieldnames(named_rows);
    for a = 1:length(fnames)
        named_rows.(fnames{a}) = true;%~options.(fnames{a});
    end
end

%% Get named rows
bells = 2*ceil(bells/2);
input = namedargs2cell(named_rows);
rows = unique(cell2mat(struct2cell(get_named_rows(bells, input{:}))),"rows","stable");

%% Generate distance matrix
distance_mat = zeros(size(rows,1));
for i = 1:size(rows,1)
    for j = 1:size(rows,1)
        if i ~= j
            distance_mat(i,j) = countsteps(rows(i,:),rows(j,:));
        end
    end
end

%% Find fastest route
if distance_mat == 0
    line = rows;
    return
end
tours = tsp(distance_mat);
idx = [1 tours{:}];
output.index = idx';
named_rows_names = fieldnames(named_rows);
named_rows_names = named_rows_names(structfun(@(x) x, named_rows));
order = named_rows_names(idx);
rows = rows(idx,:);

%% Generate line
for i = 1:size(rows,1)-1
    [~,callrows{i+1}] = countsteps(rows(i,:),rows(i+1,:)); %#ok cannot know number of changes
end
callrows(cellfun(@(x) isempty(x),callrows)) = [];
callrows = vertcat(callrows{:});

%% Remove duplicate rows
% End of countsteps & beginning of next. Also for low bells where named changes may be identical.
callrows(~[1;sum(diff(callrows,1)~=0,2)~=0],:) = [];
line = callrows;

%% Place Notation
pl = callrows.*[true([1 size(callrows,2)]); ~diff(callrows,1)~=0];
idx = diff(pl,[],1);
pl(:,all(idx==0,1)) = [];
pl = arrayfun(@(x) find(pl(x,:)~=0), 2:size(pl,1), 'uni',0)';
pl = vertcat(pl{:});
output.place_notation = string(pl);

output.place_notation(pl==10) = "0";
output.place_notation(pl==11) = "E";
output.place_notation(pl==12) = "T";
output.place_notation(:,end+1) = ".";
placenotation = extractBefore(strjoin(reshape(output.place_notation',1,[]),""), numel(output.place_notation));

% output.avg_changes_for_new_named_row = size(callrows,1)/(size(order,1)-2);
% output.isTrue = size(unique(line, "rows"),1) == size(line,1)-1;
%%
end