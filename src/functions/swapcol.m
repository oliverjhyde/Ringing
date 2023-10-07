% Helper function to swap specific columns

function x = swapcol(x, a, b)

t = x(:,a);
x(:,a) = x(:,b);
x(:,b) = t;

end