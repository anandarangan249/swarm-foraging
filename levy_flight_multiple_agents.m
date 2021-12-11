% Create an environment of size 100x100
size = 500;
data = 150.*ones(size,size);

% Initializing
% Max Iterations
max_iter = 100;
% Number of agents
N = 10;
% Initialize N agents at the centre of the map
x = round(size/2).*ones(N,1);
y = round(size/2).*ones(N,1);
% Levy Flight parameters
beta = 0.8;
u = 0; s_u = 0;
v = 0; s_v = 1;

for i = 1:max_iter
    
    for k = 1:N
        % Robot Spawn position;
        %x(k) = randi(size);
        %y(k) = randi(size);
        
        data(x(k),y(k)) = 255; % Marking the places robot has visited with red
        s = 0;
        while s==0
            s_u = ((gamma(1+beta)*sin(pi*beta/2))/(gamma((1+beta)/2)*(2^((beta-1)/2))*beta))^(1/beta);
            u = normrnd(0,s_u^2);
            v = normrnd(    0,s_v^2);
            s = round(u/((abs(v)^(1/beta))));
        end
        dx = 0; dy = 0;
        while dx == 0 && dy == 0
            dx = randi(3)-2;
            dy = randi(3)-2;
        end
        for j = 1:abs(s)
            x(k) = max(min(x(k)+dx,size),1);
            y(k) = max(min(y(k)+dy,size),1);
            data(x(k),y(k)) = 255;
        end
    end
    % Display it.
    image(data);
    % Initialize a color map array of 256 colors.
    colorMap = turbo(256);
    % Apply the colormap and show the colorbar
    colormap(colorMap);
    colorbar;
    pause(0.001)
    display(i);
end


% Display it.
image(data);
% Initialize a color map array of 256 colors.
colorMap = turbo(256);
% Apply the colormap and show the colorbar
colormap(colorMap);
colorbar;