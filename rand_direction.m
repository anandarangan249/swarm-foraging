function [dx, dy] = rand_direction
    dx = 0; dy = 0;
    while dx == 0 && dy == 0
        dx = randi(3)-2;
        dy = randi(3)-2;
    end
end