function [data, APF] = go_to_nest(x,y,nest,data,APF)
    ph_size = round(size(data,1)/size(APF,1));
    x_prev = x; y_prev = y;
    while x ~= nest || y ~= nest
        if x<nest
            x = x+1;
        end
        if x>nest
            x = x-1;
        end
        if y<nest
            y = y+1;
        end
        if y>nest
            y = y-1;
        end
        data(x,y) = 255;
        APF(round(x/ph_size),round(y/ph_size)) = min(APF(round(x/ph_size),round(y/ph_size)),0.5*(APF(round(x_prev/ph_size),round(y_prev/ph_size))+200));
        x_prev = x; y_prev = y;
        %APF = APF_decay(APF);
        %display_sim(data, APF);
    end
end