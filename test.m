x = [125;126;127;128;129;130;131;132;133;134];
y = [125;126;135;128;129;130;131;145;156;134];
data = 150.*ones(250,250);
[new_x,new_y,new_data] = voronoi_coverage(x,y,data,data);
final_pos = [new_x,new_y];
display(final_pos)
for i=1:size(final_pos(1,1))
    data(round(final_pos(i,1)),round(final_pos(i,2))) = 255;
end
%display_sim(data,new_data);