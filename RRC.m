function h = RRC(tvTs,beta)
% This function calculates the impusle response of a root-raised-cosine
% filter.

h = (sin(pi*tvTs*(1-beta))+4*beta*tvTs.*cos(pi*tvTs*(1+beta)))./(pi*tvTs.*(1-(4*beta*tvTs).^2));

i = find(tvTs==0);
if ~isempty(i)
    h(i) = 1 - beta + 4*beta/pi;
end

i = find(abs(tvTs)*4*beta == 1);
if ~isempty(i) 
    h(i) = beta*((1+2/pi)*sin(pi/4/beta)+(1-2/pi)*cos(pi/4/beta))/sqrt(2);
end
