function data = spawn_food(data)

x_food1 = 150; y_food1 = 150;
data(x_food1-5:x_food1+5,y_food1-5:y_food1+5) = 50;

x_food2 = 350; y_food2 = 350;
data(x_food2-10:x_food2+10,y_food2-10:y_food2+10) = 50;

end