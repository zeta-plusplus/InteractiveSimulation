within InteractiveSimulation.System;

block RunPyScript01
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
  parameter String nameFile = "pyConsole02.py";
  parameter String namePath = "modelica://InteractiveSimulation/Output";
  parameter String namePythonPath= "C:/ProgramData/Anaconda3";
  
  //******************************************************************************************
protected
  parameter String nameFullPath = Files.loadResource(namePath);
  parameter String nameFilePath = namePath + "/" + nameFile;
  parameter String nameFullFilePath = Files.loadResource(nameFilePath);
  //******************************************************************************************
initial algorithm
//----- display inputs on command line -----
  Streams.print("full path: " + nameFullPath);
  Streams.print("script name: " + nameFile);
  
  System.setEnvironmentVariable("PATH", namePythonPath, true);
  System.command("python " + nameFullFilePath);
  
  
  annotation(
    defaultComponentName = "RunPyScript",
    Icon(graphics = {Rectangle(origin = {0, 1}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 99}, {100, -101}}), Text(origin = {1, -79}, extent = {{-101, 3}, {99, -17}}, textString = "%name"), Text(origin = {1, 7}, extent = {{-101, 13}, {99, -17}}, textString = "RunPyScript01")}, coordinateSystem(initialScale = 0.1)));
    
    
end RunPyScript01;
