within InteractiveSimulation.System;

block RunBatch00
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
  parameter String nameFile = "testTkinter.bat";
  parameter String namePath = "modelica://InteractiveSimulation/Output";
  /* ---------------------------------------------
          variable
    --------------------------------------------- */
  discrete String defaultWorkDir;
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
//----- run batch file -----
  System.setWorkDirectory(nameFullPath);
// move to specified directory
  Streams.print("work dir is moved to: " + nameFullPath);
  System.command(nameFullFilePath);
  
//----- move work directory back to default -----
  System.setWorkDirectory(defaultWorkDir);
  Streams.print("work dir is moved back to: " + defaultWorkDir);
//******************************************************************************************
algorithm
  when initial() then
    defaultWorkDir := System.getWorkDirectory();
  end when;
  annotation(
    defaultComponentName = "RunPyScript",
    Icon(graphics = {Rectangle(origin = {0, 1}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 99}, {100, -101}}), Text(origin = {1, -79}, extent = {{-101, 3}, {99, -17}}, textString = "%name"), Text(origin = {1, 7}, extent = {{-101, 13}, {99, -17}}, textString = "RunPyScript00")}, coordinateSystem(initialScale = 0.1)));
end RunBatch00;
