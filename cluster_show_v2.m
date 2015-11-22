function [] = cluster_show_v2(n)%n is the cluster number
%Read data from file, and plot them in a figure.
for ii=1:n
    %Read the data from each file one by one.
    filename=['cluster_data',num2str(ii),'.txt'];
    [x,y]=textread(filename,'%d %d');
    %Plot the points in the figure.
    scatter(x,y);
    hold on;
    %Plot the lines between the points from the same cluster
    TRI=delaunay(x,y);
    triplot(TRI,x,y);
    hold on;
end
hold off