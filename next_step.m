function [x, y, data, APF] = next_step(x, y, s, dx, dy, data, APF, nest)
    length = size(data,1);
    ph_size = round(length/size(APF,1));
    for j = 1:abs(s)
        [dx,dy] = follow_APF(round(x/ph_size)+1, round(y/ph_size)+1, dx,dy,APF);
        x = max(min(x+dx,length),1);
        y = max(min(y+dy,length),1);
        if data(x,y) == 50
            APF(round(x/ph_size)+1,round(y/ph_size)+1) = 0;
            APF = APF_decay(APF);
            [data, APF] = go_to(x,y,nest,nest,data,APF);
            x = nest; y = nest;
            break
        end
        data(x,y) = 255;
    end
end