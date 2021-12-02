function [x, y, data, APF, found] = next_step(x, y, s, dx, dy, data, APF)
    length = size(data,1);
    ph_size = round(length/size(APF,1));
    found = 0;
    for j = 1:abs(s)
        x = max(min(x+dx,length),1);
        y = max(min(y+dy,length),1);
        if data(x,y) == 200
            found = 1;
            APF(round(x/ph_size),round(y/ph_size)) = 0;
            APF = APF_decay(APF);
            break
        end
        data(x,y) = 255;
    end
end