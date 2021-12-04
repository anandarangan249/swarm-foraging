function [x,y] = spawn_robot(N,nest,length)
%x = randi(length,N,1); y = randi(length,N,1);
x = nest.*ones(N,1); y = nest.*ones(N,1);
end