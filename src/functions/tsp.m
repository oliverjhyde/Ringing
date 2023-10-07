function [tours] = tsp(distanceMatrix)
%% Travelling Salesman Problem
% Adapted from the TSP Example, Matlab Optimization Toolbox (https://mathworks.com/help/optim/ug/travelling-salesman-problem.html)

numberOfCities = size(distanceMatrix,1); %number of cities
c=1;
for count = 1:numberOfCities:(numberOfCities*numberOfCities)
    cityPairs(count:numberOfCities*c, 1) = c;
    cityPairs(count:numberOfCities*c, 2) = 1:numberOfCities;
    distanceVector(count:numberOfCities*c, 1) = distanceMatrix(c,:)';
    c=c+1;
end
lengthDistanceVector = length(distanceVector);

%% Equality Constraints
% Number of trips = number of cityPairs
Aeq = spones(1:length(cityPairs)); 
beq = numberOfCities;

% Number of trips to a city = 1 and from a city = 1
Aeq = [Aeq;spalloc(2*numberOfCities,length(cityPairs),2*numberOfCities*(numberOfCities+numberOfCities-1))]; %allocate a sparse matrix to preallocate memory for the equality constraints;
c=1;
for count = 1:2:((2*numberOfCities)-1)
    columnSum = sparse(cityPairs(:,2)==c);
    Aeq(count+1,:) = columnSum'; % include in the constraint matrix
    rowSum = cityPairs(:,1)==c;
    Aeq(count+2,:) = rowSum';
    c=c+1;
end
beq = [beq; ones(2*numberOfCities,1)];

% Non-existing routes
nonExists = sparse(distanceVector == 0);
Aeq(2*c,:) = nonExists';
beq = [beq; 0];


%% Binary Bounds
% Setting the decision variables as binary variables
intcon = 1:lengthDistanceVector;
lb = zeros(lengthDistanceVector,1);
ub = ones(lengthDistanceVector,1);

%% Optimize Using intlinprog
opts = optimoptions('intlinprog','CutGeneration','Advanced','NodeSelection','mininfeas','Display','off');
[decisionVariables,~,~,~] = intlinprog(distanceVector,intcon,[],[],Aeq,beq,lb,ub,opts);

%% Subtour Detection
tours = detectSubtours(decisionVariables,cityPairs);
numberOfTours = length(tours); 

%% Subtour Constraints
A = spalloc(0,lengthDistanceVector,0); % creating sparse inequality constraint matrix
b = [];
while numberOfTours > 1 % repeat until there is just one subtour
    b = [b;zeros(numberOfTours,1)]; % entering inequality constraints RHS
    A = [A;spalloc(numberOfTours,lengthDistanceVector,numberOfCities)]; % entering inequality constraints LHS
    for count = 1:numberOfTours
        inequalityConstraintNumber = size(A,1)+1;
        subTourId = tours{count}; % Extracting subtour one by one
        
        % adding subtour constraints (inequality constraints)
        subTourPairs = nchoosek(1:length(subTourId),2);
        for jj = 1:size(subTourPairs,1) % Finding variables associated with the current sub tour
            subTourVariable = (sum(cityPairs==subTourId(subTourPairs(jj,1)),2)) & ...
                       (sum(cityPairs==subTourId(subTourPairs(jj,2)),2)); 
            A(inequalityConstraintNumber,subTourVariable) = 1;
        end
        b(inequalityConstraintNumber) = length(subTourId)-1; % reducing number of trips allowed by One Ex., A-B-A: 2 -> 1
    end

    % Optimize again
    [decisionVariables,~,~,~] = intlinprog(distanceVector,intcon,A,b,Aeq,beq,lb,ub,opts);
    
    % Check for subtours again
    tours = detectSubtours(decisionVariables,cityPairs);
    numberOfTours = length(tours); 
end

%% END.
end