within InteractiveSimulation.Examples.Temp;

model C_pyRunString00_temp01
  import InteractiveSimulation.Output.Functions;
  extends Modelica.Icons.Example;
algorithm
  Functions.C_pyRunString00("print('hello world')");
  
end C_pyRunString00_temp01;
