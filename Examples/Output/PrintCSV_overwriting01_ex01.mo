within InteractiveSimulation.Examples.Output;

model PrintCSV_overwriting01_ex01
  extends Modelica.Icons.Example;
  InteractiveSimulation.Output.PrintCSV_overwriting01 PrintOnCSV(nVariables = 3, nameVariables = {"time(in Modelica)", "sin(time)", "cos(time)"})  annotation(
    Placement(visible = true, transformation(origin = {10, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica_DeviceDrivers.Blocks.OperatingSystem.SynchronizeRealtime synchronizeRealtime1(enable = true)  annotation(
    Placement(visible = true, transformation(origin = {-80, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine1(amplitude = 1, freqHz = 1)  annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Cosine cosine1(amplitude = 2, freqHz = 1)  annotation(
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Utilities.TimeSignalOut timeSignalOut1 annotation(
    Placement(visible = true, transformation(origin = {-50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(timeSignalOut1.y, PrintOnCSV.u_variables[1]) annotation(
    Line(points = {{-38, -30}, {-24, -30}, {-24, 20}, {0, 20}, {0, 20}}, color = {0, 0, 127}));
  connect(sine1.y, PrintOnCSV.u_variables[2]) annotation(
    Line(points = {{-38, 30}, {-34, 30}, {-34, 20}, {-1, 20}}, color = {0, 0, 127}));
  connect(cosine1.y, PrintOnCSV.u_variables[3]) annotation(
    Line(points = {{-38, 0}, {-30, 0}, {-30, 20}, {-1, 20}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
  
end PrintCSV_overwriting01_ex01;
