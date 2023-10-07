% Helper function to only flipud specific columns

function x = flipudc(x, a)

x(:,a) = flipud(x(:,a));

end