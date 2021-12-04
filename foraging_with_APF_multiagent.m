% Create an environment of length x length
length = 500;
data = 100.*ones(length,length);
nest = round(length/2);

% Create APF environment
ph_size = 5;
APF_size = round(length/ph_size)+1;
APF = 255.*ones(APF_size,APF_size);

%Create a 40x40 food source at x_food,y_food
data = spawn_food(data);

% Initializing
% Max Iterations
max_iter = 2000;

% Robot Spawn position;
N = 10;
[x,y] = spawn_robot(N, nest,length);
for i = 1:N
    data(x(i),y(i)) = 255;
end

% Food found flag
found = 0;

for i = 1:max_iter
    for k = 1:N
        s = levy_step;
        [dx,dy] = rand_direction;
        [x(k), y(k), data, APF] = next_step(x(k), y(k), s, dx, dy, data, APF, nest);
    end
    APF = APF_decay(APF);
    % Display it.
    display_sim(data,APF);
    display(i);
end


% Display it.
display_sim(data,APF);