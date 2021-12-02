function s = levy_step
    % Levy Flight parameters
    beta = 1.1;
    u = 0; s_u = 0;
    v = 0; s_v = 1;
    s = 0;
    while s==0
        s_u = ((gamma(1+beta)*sin(pi*beta/2))/(gamma((1+beta)/2)*(2^((beta-1)/2))*beta))^(1/beta);
        u = normrnd(0,s_u^2);
        v = normrnd(0,s_v^2);
        s = round(u/((abs(v)^(1/beta))));
    end
end