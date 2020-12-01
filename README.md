# Voronoi diagrams for polygonal obstacles
## Details
Extending Matlab's Voronoi diagram functionality from point objects to 2D polygonal objects. Please refer to slides (project_slides.pdf) and the report (report.pdf) for illustrated details.
There are 4 Matlab files in main project directory:

  1.Obstacle Draw.m 
  
 2. Get Voronoi.m
  
  3.Final Path.m  
  
  4.dijkstra.m

## Usage
Using Obstacle Draw.m any polygonal obstacle configuration
can be drawn. For drawing obstacle Obstacle Draw.m
needs to be run first then a figure window will come. 

To draw an n-gonal object n-clicks at desired points should be
made. After n clicks return keys needs to be be pressed
which confirms the drawing of that object. 

After pressing
return key new object can be drawn. In Obstacle Draw.m
the number of object can be changed by changing value
of parameter Num Object. value of Epsilon can also be
specified there. These configuration will be saved in .mat 
file format in directory Obstacle Files where the image of
obstacle configuration corresponding to each .mat file is shown
for reference. 

There are few obstacles configuration files already there for test.
The filename can be changed by changing the
string variable FILE NAME.

Now using Get Voronoi.m any
of the obstacle configuration can be loaded by specifying
the filename stored in string variable LOAD FILE NAME.
By running Get Voronoi.m the Start and Goal points can
be specified in the obstacle figure by two consecutive clicks
after it Voronoi diagram for the obstacle configuration will be
generated.

Point voronoi diagram can also be seen by uncommenting line 42(%voronoi(X_Total_points,Y_Total_points);)
After that, running Final Path.m (Not closing the generated figure will retain the voronoi diagram in the figure) will give the path
from Start to Goal.


The file dijkstra.m contains the code for Dijkstra's Algorithm
