function [dx, dy] = follow_APF(x1, y1, dx, dy, APF)
    length = size(APF,1);
    adj_APF = 255.*ones(8,1);                                                 % array of adjacent APFs [topleft, top, topright, left, right, bot_left, bot, bot_right]
    if x1 > 1
        adj_APF(4) = APF(x1-1,y1);
        if y1 > 1
            adj_APF(1) = APF(x1-1,y1-1);
            adj_APF(2) = APF(x1,y1-1);
        end
        if y1 < length
            adj_APF(6) = APF(x1-1,y1+1);
            adj_APF(7) = APF(x1,y1+1);
        end
    end
    if x1 < length
        adj_APF(5) = APF(x1+1,y1);
        if y1 > 1
            adj_APF(2) = APF(x1,y1-1);
            adj_APF(3) = APF(x1+1,y1-1);
        end
        if y1 < length
            adj_APF(7) = APF(x1,y1+1);
            adj_APF(8) = APF(x1+1,y1+1);
        end
    end
    
    ind = 0;
    [min_APF,ind] = min(adj_APF);
    if min_APF < APF(x1,y1)
        if ind == 1
            dx = -1; dy = -1;
        end
        if ind == 2
            dx = 0; dy = -1;
        end
        if ind == 3
            dx = +1; dy = -1;
        end
        if ind == 4
            dx = -1; dy = 0;
        end
        if ind == 5
            dx = 1; dy = 0;
        end
        if ind == 6
            dx = -1; dy = 1;
        end
        if ind == 7
            dx = 0; dy = 1;
        end
        if ind == 8
            dx = 1; dy = 1;
        end
    end