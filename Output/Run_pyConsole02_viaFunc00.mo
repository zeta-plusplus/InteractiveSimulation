within InteractiveSimulation.Output;

block Run_pyConsole02_viaFunc00
  /********************************************************
          imports
    ********************************************************/
  import Modelica.Utilities.Streams;
  import Modelica.Utilities.Files;
  import Modelica.Utilities.System;
  import Modelica.SIunits;
  import InteractiveSimulation.Output.Functions;
  /********************************************************
          Declaration
    ********************************************************/
  /* ---------------------------------------------
          parameters
    --------------------------------------------- */
  parameter String namePythonPath = "C:/ProgramData/Anaconda3";
  //******************************************************************************************
protected
  parameter String nameFile = "pyConsole02.py";
  parameter String namePath = "modelica://InteractiveSimulation/Output";
  parameter String nameFullPath = Files.loadResource(namePath);
  parameter String nameFilePath = namePath + "/" + nameFile;
  parameter String nameFullFilePath = Files.loadResource(nameFilePath);
  //******************************************************************************************
initial algorithm
//----- display inputs on command line -----
  Streams.print("full path: " + nameFullPath);
  Streams.print("script name: " + nameFile);
  Streams.print("script full file path: " + nameFullFilePath);
  System.setEnvironmentVariable("PATH", namePythonPath, true);
  InteractiveSimulation.System.Functions.C_runPyScript00(nameFullPath, nameFile);
  annotation(
    defaultComponentName = "pyConsole",
    Diagram,
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, -86}, extent = {{-100, 10}, {100, -10}}, textString = "%name"), Text(origin = {0, 10}, extent = {{-100, 10}, {100, -20}}, textString = "pyConsole02")}, coordinateSystem(initialScale = 0.1)));
end Run_pyConsole02_viaFunc00;
