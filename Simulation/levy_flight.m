% Create an environment of size 100x100
size = 500;
data = 100.*ones(size,size);

% Initializing
% Max Iterations
max_iter = 10000;
% Robot Spawn position;
%x = randi(size);
%y = randi(size);
x = round(size/2); y = round(size/2);
data(x,y) = 255; % Marking the places robot has visited with red
% Levy Flight parameters
beta = 1.3;
u = 0; s_u = 0;
v = 0; s_v = 1;

for i = 1:max_iter
    s = 0;
    while s==0
        s_u = ((gamma(1+beta)*sin(pi*beta/2))/(gamma((1+beta)/2)*(2^((beta-1)/2))*beta))^(1/beta);
        u = normrnd(0,s_u^2);
        v = normrnd(0,s_v^2);
        s = round(u/((abs(v)^(1/beta))));
    end
    dx = 0; dy = 0;
    while dx == 0 && dy == 0
        dx = randi(3)-2
        dy = randi(3)-2
    end
    for i = 1:abs(s)
        x = max(min(x+dx,size),1);
        y = max(min(y+dy,size),1);
        data(x,y) = 255;
    end
end


% Display it.
image(data);
% Initialize a color map array of 256 colors.
colorMap = turbo(256);
% Apply the colormap and show the colorbar
colormap(colorMap);
colorbar;