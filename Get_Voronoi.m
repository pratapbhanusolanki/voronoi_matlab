%function [ Temp_Edge ] = Voronoi_Graph( Voro_Vertex, Voro_Cell, All_cells_Number,Cell_start )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


clear all;
close all;
clc;

%specify file name here to load from
LOAD_FILE_NAME = 'Obstacle_config006';

load(strcat(strcat('./Obstacle_Files/',LOAD_FILE_NAME)));



%Code for drawing obstale configuration
for i=1:Num_Object
    for r=1:length(X1{i})
       a=r;
       if(r==length(X1{i}))
           b=1;
       else
           b=r+1;
       end
       x=[X1{i}(a,1) X1{i}(b,1)];
       y=[X1{i}(a,2) X1{i}(b,2)];
       plot(x,y,'Color', 'Black');
       hold on;
    end
end

%Code for taking Start and End point as input
Start = ginput(1);
plot(Start(1),Start(2),'--go','MarkerSize',10,'MarkerFaceColor','g');
drawnow;
Goal  = ginput(1);
plot(Goal(1),Goal(2),'--ro','MarkerSize',10,'MarkerFaceColor','r');
drawnow;

%Uncomment following to Draw voronoi diagram of point obstacles
%voronoi(X_Total_points,Y_Total_points);
%Getting Parameters of Voronoi Diagram
[Voro_Vertex,Voro_Cell] = voronoin([X_Total_points' Y_Total_points']);

k=1;
temp=0;
for i=1:length(All_cells_Number)
    L=length(Voro_Cell{i});
  for j=1:L
      a=Voro_Cell{i}(j);
      if(j==L)
          b=Voro_Cell{i}(1);
      else
          b=Voro_Cell{i}(j+1);
      end
      for l=1:Num_Object
          if(temp==1)
              temp=0;
              break;
          end
          if (l==All_cells_Number(i));
              continue;
          end
          for m=Cell_start(l):Cell_start(l+1)-2
              if((~isempty(find(Voro_Cell{m}==a)))&(~isempty(find(Voro_Cell{m}==b))))
                  Temp_Edge(k,:)=[a b];
                  k=k+1;
                  temp=1;
                  break;
              end
          end     
      end
  end    
end

Temp_Edge=unique(Temp_Edge,'rows');

%figure;
axis([0 100 0 100]);
hold on;

for i=1:length(Temp_Edge)
    Edge_X1(i)=Voro_Vertex(Temp_Edge(i,1),1);
    Edge_X2(i)=Voro_Vertex(Temp_Edge(i,2),1);
    Edge_Y1(i)=Voro_Vertex(Temp_Edge(i,1),2);
    Edge_Y2(i)=Voro_Vertex(Temp_Edge(i,2),2);
    plot([Edge_X1(i) Edge_X2(i)],[Edge_Y1(i) Edge_Y2(i)],'color','g','LineWidth',2);
end



