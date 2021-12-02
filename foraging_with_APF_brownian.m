% Create an environment of length x length
length = 500;
data = 100.*ones(length,length);

% Create APF environment
ph_size = 15;
APF_size = round(length/ph_size)
APF = 255.*ones(APF_size,APF_size);

%Create a 40x40 food source at x_food,y_food
x_food = 150; y_food = 150;
data(x_food-20:x_food+20,y_food-20:y_food+20) = 200;
data(x_food-10:x_food+10,y_food-10:y_food+10) = 100;

% Initializing
% Max Iterations
max_iter = 500;
% Robot Spawn position;
%x = randi(size);
%y = randi(size);
%start = round(length/2);
nest = round(length/2);
start = x_food;
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
            x = max(min(x+dx,length),1);
            y = max(min(y+dy,length),1);
            if data(x,y) == 200
                found = 1;
                APF(round(x/ph_size),round(y/ph_size)) = 0;
                APF = APF_decay(APF);
                break
            end
            data(x,y) = 255;
        end
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
            % Display it.
            figure(1);
            set(gcf,'Position',[50 50 1300 500]);
            subplot(1,2,1);
            image(data);
            subplot(1,2,2);
            image(APF);
            % Initialize a color map array of 256 colors.
            colorMap = turbo(256);
            % Apply the colormap and show the colorbar
            colormap(colorMap);
            colorbar;
            pause(0.001);
        end
    end
    APF = APF_decay(APF);
    % Display it.
    figure(1);
    set(gcf,'Position',[50 50 1300 500]);
    subplot(1,2,1);
    image(data);
    subplot(1,2,2);
    image(APF);
    % Initialize a color map array of 256 colors.
    colorMap = turbo(256);
    % Apply the colormap and show the colorbar
    colormap(colorMap);
    colorbar;
    pause(0.001);
    display(i);
end


% Display it.
figure(1);
set(gcf,'Position',[50 50 1300 500]);
subplot(1,2,1);
image(data);
subplot(1,2,2);
image(APF);
% Initialize a color map array of 256 colors.
colorMap = turbo(256);
% Apply the colormap and show the colorbar
colormap(colorMap);
colorbar;
