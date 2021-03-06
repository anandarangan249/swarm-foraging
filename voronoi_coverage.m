function [x,y,data,classifications] = voronoi_coverage(x,y,data,APF)
[rows,cols] = size(data);
[no_of_robots,]= size(x);
centroids = [x,y];
classifications = zeros(rows,cols);
max_iter = 30;
loss = 0;
for i = 1:max_iter
    for j=1:rows
        for k=1:cols
            distance_from_centroid = zeros(1,no_of_robots(1,1));
  
            for l=1:no_of_robots
                distance_from_centroid(1,l) = sqrt(((j-centroids(l,1))^2)+((k-centroids(l,2))^2));
            end
            [M,classifications(j,k)] = min(distance_from_centroid);
        end
    end
    new_centroid = zeros(no_of_robots(1,1),2);
    new_loss = 0;
    for m=1:no_of_robots
        [r,c] = find(classifications == m);
        new_centroid(m,1)=mean(r);
        new_centroid(m,2)=mean(c);
        if isempty(r)
            new_centroid(m,:) = centroids(m,:);
        end
        data(round(new_centroid(m,1))+1,round(new_centroid(m,2))+1) = 255;
        for n=1:rows
            for o=1:cols
                new_loss = new_loss + sqrt(((n-centroids(m,1))^2)+((o-centroids(m,2))^2));
            end
        end
    end
    if abs(new_loss-loss) < 0.001
        break
    end
    centroids = new_centroid;
    loss = new_loss;
    display_sim(data,APF);
end
x = min(rows,max(1,round(centroids(:,1))));
y = min(cols,max(1,round(centroids(:,2))));
end