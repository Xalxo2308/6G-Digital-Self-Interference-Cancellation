function h = RC(tvTs,beta)
% This function calculates the impusle response of a raised-cosine filter.


h = (sin(pi*tvTs).*cos(pi*tvTs*beta))./(pi*tvTs.*(1-(2*beta*tvTs).^2));

i = find(tvTs==0);
if ~isempty(i)
    h(i) = 1;
end

i = find(abs(tvTs)*2*beta == 1);
if ~isempty(i) 
    h(i) = pi/4*sin(pi/2/beta)/(pi/2/beta);
end
% find(tvTs==0): This part uses the conditional expression tvTs==0 to find elements in the vector tvTs with value 0. 
% The find function returns the index of the element that satisfies the condition. 
% If there are multiple elements with value 0 in tvTs, their corresponding indexes will be returned as an index array.
% i = find(tvTs==0): This line assigns the returned index to the variable i for use in subsequent code

% ~isempty(i): This is a conditional expression used to determine whether the variable i is not empty. 
% The 'isempty' function is a built-in function in MATLAB that checks whether a given variable is empty. 
% A condition '~' means negation, so ~isempty(i) means if i is not empty (i.e. contains an index), then the condition is true