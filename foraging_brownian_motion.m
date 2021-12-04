% Create an environment of size 100x100
size = 500;
data = 100.*ones(size,size);
%Create a 50x50 food source at x_food,y_food
x_food = 220; y_food = 220;
data(x_food-20:x_food+20,y_food-20:y_food+20) = 200;

% Initializing
% Max Iterations
max_iter = 1000;
% Robot Spawn position;
%x = randi(size);
%y = randi(size);
start = round(size/2);
x = start; y = start;
data(x,y) = 255; % Marking the places robot has visited with red

% Food found flag
found = 0;

for i = 1:max_iter
    if found == 0
        s = 0;
        while s==0
            s = round(normrnd(0,1));
        end
        dx = 0; dy = 0;
        while dx == 0 && dy == 0
            dx = randi(3)-2;
            dy = randi(3)-2;
        end
        for j = 1:abs(s)
            x = max(min(x+dx,size),1);
            y = max(min(y+dy,size),1);
            if data(x,y) == 200
                found = 1;
                break
            end
            data(x,y) = 255;
        end
    end
    if found == 1
        while x ~= start || y ~= start
            if x<start
                x = x+1;
            end
            if x>start
                x = x-1;
            end
            if y<start
                y = y+1;
            end
            if y>start
                y = y-1;
            end
            data(x,y) = 255;
            % Display it.
            image(data);
            % Initialize a color map array of 256 colors.
            colorMap = turbo(256);
            % Apply the colormap and show the colorbar
            colormap(colorMap);
            colorbar;
            pause(0.001);
        end
        break
    end
    % Display it.
    image(data);
    % Initialize a color map array of 256 colors.
    colorMap = turbo(256);
    % Apply the colormap and show the colorbar
    colormap(colorMap);
    colorbar;
    pause(0.001);
    display(i);
end


% Display it.
image(data);
% Initialize a color map array of 256 colors.
colorMap = turbo(256);
% Apply the colormap and show the colorbar
colormap(colorMap);
colorbar;