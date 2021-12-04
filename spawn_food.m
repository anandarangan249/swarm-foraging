function data = spawn_food(data)
x_food1 = 150; y_food1 = 150;
data(x_food1-20:x_food1+20,y_food1-20:y_food1+20) = 50;
data(x_food1-10:x_food1+10,y_food1-10:y_food1+10) = 100;
%{
x_food2 = 350; y_food2 = 350;
data(x_food2-20:x_food2+20,y_food2-20:y_food2+20) = 50;
data(x_food2-10:x_food2+10,y_food2-10:y_food2+10) = 100;

x_food3 = 350; y_food3 = 150;
data(x_food3-20:x_food3+20,y_food3-20:y_food3+20) = 50;
data(x_food3-10:x_food3+10,y_food3-10:y_food3+10) = 100;

x_food4 = 150; y_food4 = 350;
data(x_food4-20:x_food4+20,y_food4-20:y_food4+20) = 50;
data(x_food4-10:x_food4+10,y_food4-10:y_food4+10) = 100;

x_food5 = 100; y_food5 = 250;
data(x_food5-20:x_food5+20,y_food5-20:y_food5+20) = 50;
data(x_food5-10:x_food5+10,y_food5-10:y_food5+10) = 100;

x_food6 = 250; y_food6 = 100;
data(x_food6-20:x_food6+20,y_food6-20:y_food6+20) = 50;
data(x_food6-10:x_food6+10,y_food6-10:y_food6+10) = 100;

x_food7 = 400; y_food7 = 250;
data(x_food7-20:x_food7+20,y_food7-20:y_food7+20) = 50;
data(x_food7-10:x_food7+10,y_food7-10:y_food7+10) = 100;

x_food8 = 250; y_food8 = 400;
data(x_food8-20:x_food8+20,y_food8-20:y_food8+20) = 50;
data(x_food8-10:x_food8+10,y_food8-10:y_food8+10) = 100;
%}
end