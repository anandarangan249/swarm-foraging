function [data, APF] = go_to(x,y,x_goal, y_goal,data,APF)
    ph_size = round(size(data,1)/size(APF,1));
    x_prev = x; y_prev = y;
    while x ~= x_goal || y ~= y_goal
        if x<x_goal
            x = x+1;
        end
        if x>x_goal
            x = x-1;
        end
        if y<y_goal
            y = y+1;
        end
        if y>y_goal
            y = y-1;
        end
        data(x,y) = 255;
        if x_goal == round(size(data,1)/2) && y_goal == round(size(data,1)/2)
            APF(round(x/ph_size),round(y/ph_size)) = min(APF(round(x/ph_size),round(y/ph_size)),0.5*(APF(round(x_prev/ph_size),round(y_prev/ph_size))+200));
        end
        x_prev = x; y_prev = y;
        %APF = APF_decay(APF);
        %display_sim(data, APF);
    end
end