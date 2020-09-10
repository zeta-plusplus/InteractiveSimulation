within InteractiveSimulation.Utilities;

block TimeSignalOut
  output Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
algorithm
  y:= time;
  
annotation(
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-100, 100}, {100, -100}}), Text(origin = {5, -4}, extent = {{-103, 24}, {93, -16}}, textString = "Time"), Text(origin = {3, -78}, extent = {{-103, 4}, {97, -16}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));end TimeSignalOut;
