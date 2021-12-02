% Create an environment of length x length
length = 500;
data = 100.*ones(length,length);
nest = round(length/2);

% Create APF environment
ph_size = 5;
APF_size = round(length/ph_size);
APF = 255.*ones(APF_size,APF_size);

%Create a 40x40 food source at x_food,y_food
x_food = 150; y_food = 150;
data(x_food-20:x_food+20,y_food-20:y_food+20) = 200;
data(x_food-10:x_food+10,y_food-10:y_food+10) = 100;

% Initializing
% Max Iterations
max_iter = 1000;

% Robot Spawn position;
start = x_food;
x = start; y = start;
data(x,y) = 255; % Marking the places robot has visited with red

% Food found flag
found = 0;

for i = 1:max_iter
    if found == 0
        s = levy_step;
        [dx,dy] = rand_direction;
        [x, y, data, APF, found] = next_step(x, y, s, dx, dy, data, APF);
    end
    if found == 1
        while x ~= nest || y ~= nest
            if x<nest
                x = x+1;
            end
            if x>nest
                x = x-1;
            end
            if y<nest
                y = y+1;
            end
            if y>nest
                y = y-1;
            end
            data(x,y) = 255;
            APF(round(x/ph_size),round(y/ph_size)) = min(APF(round(x/ph_size),round(y/ph_size)),200);
            APF = APF_decay(APF);
            display_sim(data, APF);
        end
    end
    APF = APF_decay(APF);
    % Display it.
    display_sim(data,APF);
    display(i);
end


% Display it.
display_sim(data,APF);
