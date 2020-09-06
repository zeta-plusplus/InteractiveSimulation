within InteractiveSimulation.Examples.Temp;

model dispVarPyConsole02_00_temp02
  extends Modelica.Icons.Example;
  Modelica_DeviceDrivers.Blocks.OperatingSystem.SynchronizeRealtime synchronizeRealtime1(enable = true) annotation(
    Placement(visible = true, transformation(origin = {-80, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine1(amplitude = 1, freqHz = 1) annotation(
    Placement(visible = true, transformation(origin = {-50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Cosine cosine1(amplitude = 2, freqHz = 1) annotation(
    Placement(visible = true, transformation(origin = {-50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  InteractiveSimulation.Utilities.TimeSignalOut timeSignalOut1 annotation(
    Placement(visible = true, transformation(origin = {-50, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  InteractiveSimulation.Output.PrintCSV_overwriting01 PrintOnCSV(nVariables = 3, nameVariables = {"sine", "cosine", "time"})  annotation(
    Placement(visible = true, transformation(origin = {-10, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  InteractiveSimulation.Output.Run_pyConsole02_viaFunc00 pyConsole annotation(
    Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(sine1.y, PrintOnCSV.u_variables[1]) annotation(
    Line(points = {{-39, 20}, {-23, 20}, {-23, 20}, {-23, 20}}, color = {0, 0, 127}));
  connect(timeSignalOut1.y, PrintOnCSV.u_variables[3]) annotation(
    Line(points = {{-39, -40}, {-31, -40}, {-31, 20}, {-23, 20}, {-23, 20}}, color = {0, 0, 127}));
  connect(cosine1.y, PrintOnCSV.u_variables[2]) annotation(
    Line(points = {{-39, -10}, {-37, -10}, {-37, 20}, {-23, 20}, {-23, 20}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end dispVarPyConsole02_00_temp02;
