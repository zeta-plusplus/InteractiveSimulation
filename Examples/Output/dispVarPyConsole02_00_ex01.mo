within InteractiveSimulation.Examples.Output;

model dispVarPyConsole02_00_ex01
  extends Modelica.Icons.Example;
  Modelica_DeviceDrivers.Blocks.OperatingSystem.SynchronizeRealtime synchronizeRealtime1(enable = true) annotation(
    Placement(visible = true, transformation(origin = {-80, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Sin sin1 annotation(
    Placement(visible = true, transformation(origin = { 30, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Cos cos1 annotation(
    Placement(visible = true, transformation(origin = {30, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  InteractiveSimulation.Input.AccumulateDigitalInputSignal01 Accumulate(scl = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {-50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  InteractiveSimulation.Input.AccumulateDigitalInputSignal01 Accumulate1(scl = -0.5)  annotation(
    Placement(visible = true, transformation(origin = {-50, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  InteractiveSimulation.Output.dispVarPyConsole02_00 dispVarPyConsole(nVariables = 5, namePythonPath = "C:\Program Files\Python39", nameVariables = {"time[s]", "u", "2*u", "sin(u)", "cos(u)"})  annotation(
    Placement(visible = true, transformation(origin = {90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica_DeviceDrivers.Blocks.InputDevices.KeyboardInput keyboardInput1 annotation(
    Placement(visible = true, transformation(origin = {-90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  InteractiveSimulation.Utilities.TimeSignalOut timeSignalOut1 annotation(
    Placement(visible = true, transformation(origin = {30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = 2.0)  annotation(
    Placement(visible = true, transformation(origin = {30, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(cos1.y, dispVarPyConsole.u_variables[5]) annotation(
    Line(points = {{42, -80}, {48, -80}, {48, -30}, {80, -30}, {80, -30}}, color = {0, 0, 127}));
  connect(sin1.y, dispVarPyConsole.u_variables[4]) annotation(
    Line(points = {{42, -50}, {60, -50}, {60, -30}, {80, -30}, {80, -30}}, color = {0, 0, 127}));
  connect(gain1.y, dispVarPyConsole.u_variables[3]) annotation(
    Line(points = {{42, -10}, {64, -10}, {64, -30}, {80, -30}, {80, -30}}, color = {0, 0, 127}));
  connect(add1.y, dispVarPyConsole.u_variables[2]) annotation(
    Line(points = {{2, 10}, {70, 10}, {70, -30}, {80, -30}, {80, -30}}, color = {0, 0, 127}));
  connect(timeSignalOut1.y, dispVarPyConsole.u_variables[1]) annotation(
    Line(points = {{42, 50}, {74, 50}, {74, -30}, {80, -30}, {80, -30}}, color = {0, 0, 127}));
  connect(add1.y, gain1.u) annotation(
    Line(points = {{2, 10}, {14, 10}, {14, -10}, {18, -10}, {18, -10}}, color = {0, 0, 127}));
  connect(add1.y, sin1.u) annotation(
    Line(points = {{2, 10}, {6, 10}, {6, -50}, {18, -50}}, color = {0, 0, 127}));
  connect(add1.y, cos1.u) annotation(
    Line(points = {{2, 10}, {10, 10}, {10, -80}, {18, -80}}, color = {0, 0, 127}));
  connect(keyboardInput1.keyDown, Accumulate1.u) annotation(
    Line(points = {{-90, -2}, {-90, -2}, {-90, -20}, {-62, -20}, {-62, -20}}, color = {255, 0, 255}));
  connect(keyboardInput1.keyUp, Accumulate.u) annotation(
    Line(points = {{-78, 16}, {-70, 16}, {-70, 20}, {-62, 20}, {-62, 20}}, color = {255, 0, 255}));
  connect(Accumulate1.y, add1.u2) annotation(
    Line(points = {{-38, -20}, {-32, -20}, {-32, 4}, {-22, 4}, {-22, 4}}, color = {0, 0, 127}));
  connect(Accumulate.y, add1.u1) annotation(
    Line(points = {{-38, 20}, {-36, 20}, {-36, 16}, {-22, 16}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.06),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end dispVarPyConsole02_00_ex01;
