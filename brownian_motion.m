% Create an environment of size 100x100
size = 500;
data = 100.*ones(size,size);

% Initializing
% Max Iterations
max_iter = 10000;
% Robot Spawn position;
x = randi(size);
y = randi(size);
data(x,y) = 255; % Marking the places robot has visited with red

for i = 1:max_iter
    s = 0;
    while s==0
        s = round(normrnd(0,1));
    end
    dx = 0; dy = 0;
    while dx == 0 && dy == 0
        dx = randi(3)-2;
        dy = randi(3)-2;
    end
    for i = 1:abs(s)
        x = max(min(x+dx,size),1);
        y = max(min(y+dy,size),1);
        data(x,y) = 255;
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