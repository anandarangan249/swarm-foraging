function s = brownian_step
    s = 0;
    while s==0
        s = round(normrnd(0,1));
    end
end