% Create an environment of size 100x100
length = 500;
ph_size = 10;                                                               % Strength of the pheromone
APF_size = length/ph_size;
data = 100.*ones(length,length);
APF = 100.*ones(APF_size,APF_size);

% Initializing
% Max Iterations
max_iter = 100;
% Introduce virtual pheromones at (x,y)
x = round(length/2);
y = round(length/2);
APF(round(x/ph_size)-2:round(x/ph_size)+3,round(y/ph_size)-2:round(y/ph_size)+3) = 0;
pad = 100.*ones(APF_size,1);

for i = 1:max_iter
    APF1 = [APF(:,2:APF_size),pad];
    APF2 = [pad,APF(:,1:APF_size-1)];
    APF3 = [APF(2:APF_size,:);pad'];
    APF4 = [pad';APF(1:APF_size-1,:)];
    APF = 0.9.*(APF-100)+100 + 0.02.*(APF1-100) + 0.02.*(APF2-100) + 0.02.*(APF3-100) + 0.02.*(APF4-100);
    % Display it.
    image(APF);
    % Initialize a color map array of 256 colors.
    colorMap = turbo(256);
    % Apply the colormap and show the colorbar
    colormap(colorMap);
    colorbar;
    pause(0.005);
    display(i);
end


% Display it.
image(APF);
% Initialize a color map array of 256 colors.
colorMap = turbo(256);
% Apply the colormap and show the colorbar
colormap(colorMap);
colorbar;