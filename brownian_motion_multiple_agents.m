%% Initialization
% Create an environment of size 100x100
size = 500;
data = 150.*ones(size,size);

% Initializing
% Max Iterations
max_iter = 1000;
% Number of agents
N = 10;
% Initializing N agents at the centre of the map
x = round(size/2).*ones(N,1);
y = round(size/2).*ones(N,1);

%% Brownian Motion Algorithm
for i = 1:max_iter
    for k = 1:N
        % Random Robot Spawn position;
        %x(k) = randi(size);
        %y(k) = randi(size);
        data(x(k),y(k)) = 255;                                                  % Marking the places robot has visited with red    
        s = 0;
        while s==0
            s = round(normrnd(0,1));
        end
        dx = 0; dy = 0;
        while dx == 0 && dy == 0
            dx = randi(3)-2;
            dy = randi(3)-2;
        end
        for j = 1:abs(s)                                                    % moving s steps in the direction determined by dx and dy
            x(k) = max(min(x(k)+dx,size),1);
            y(k) = max(min(y(k)+dy,size),1);
            data(x(k),y(k)) = 255;                                          % Marking the places robot has visited with red
        end
    end
    %% Display
    image(data);
    % Initialize a color map array of 256 colors.
    colorMap = turbo(256);
    % Apply the colormap and show the colorbar
    colormap(colorMap);
    colorbar;
    pause(0.001);
    display(i);
end

image(data);
% Initialize a color map array of 256 colors.
colorMap = turbo(256);
% Apply the colormap and show the colorbar
colormap(colorMap);
colorbar;
