% Create an environment of desired lengthxlength
length = 500;
ph_size = 15;                                                               % Strength of the pheromone
APF_size = round(length/ph_size);
data = 100.*ones(length,length);
APF = 255.*ones(APF_size,APF_size);

% Initializing
% Max Iterations
max_iter = 500;
% Introduce virtual pheromones at (x,y)
x = round(length/2);
y = round(length/2);
APF(round(x/ph_size)-2:round(x/ph_size)+3,round(y/ph_size)-2:round(y/ph_size)+3) = 0;
pad = 255.*ones(APF_size,1);
% Decay and Diffusion Rate
decay = 0.1
diff_rate = 0.02

for i = 1:max_iter
    APF1 = [APF(:,2:APF_size),pad];
    APF2 = [pad,APF(:,1:APF_size-1)];
    APF3 = [APF(2:APF_size,:);pad'];
    APF4 = [pad';APF(1:APF_size-1,:)];
    APF = (1-decay).*(APF-255)+255 + (diff_rate).*(APF1-255) + (diff_rate).*(APF2-255) + (diff_rate).*(APF3-255) + (diff_rate).*(APF4-255);
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