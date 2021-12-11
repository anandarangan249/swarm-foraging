function [s,dx,dy] = step_within_voronoi(x,y,k,classifications)
    valid_step = 0;
    while valid_step == 0
        s = levy_step;
        [dx, dy] = rand_direction;
        if x+dx*s > 0 && x+dx*s < size(classifications,1) && y+dy*s > 0 && y+dy*s < size(classifications,2)
            if classifications(x+dx*s,y+dy*s)==k
                valid_step = 1;
            end
        end
    end
end