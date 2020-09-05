within InteractiveSimulation.Output;

block Run_pyConsole01
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
  // NONE
  
  
  /* ---------------------------------------------
        variable
  --------------------------------------------- */
  discrete String defaultWorkDir;
  
  
//******************************************************************************************
protected
  parameter String nameFile = "pyConsole01.py";
  parameter String namePath = "modelica://InteractiveSimulation/Output";
  
  parameter String nameFullPath= Files.loadResource(namePath);
  parameter String nameFilePath = namePath + "/" + nameFile;
  parameter String nameFullFilePath = Files.loadResource(nameFilePath);
  
  
//******************************************************************************************
initial algorithm
  
  //----- display inputs on command line -----
  Streams.print("full path: "+nameFullPath);
  Streams.print("script name: "+nameFile);
  Streams.print("script full file path: "+nameFullFilePath);
  
  //----- run pyConsole -----
  System.setWorkDirectory(nameFullPath);
  Streams.print("work dir is moved to: "+nameFullPath);
  System.command("python "+nameFile); //
  
  //----- move work directory back to default -----
  System.setWorkDirectory(defaultWorkDir);
  Streams.print("work dir is moved back to: "+ defaultWorkDir);
  
  
  //******************************************************************************************
algorithm
  when(initial())then
    defaultWorkDir:= System.getWorkDirectory();
  end when;  
  
    
annotation(
    defaultComponentName = "pyConsole",
    Diagram,
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, -86}, extent = {{-100, 10}, {100, -10}}, textString = "%name"), Text(origin = {0, 10},extent = {{-100, 10}, {100, -20}}, textString = "pyConsole01")}, coordinateSystem(initialScale = 0.1)));
    
    
end Run_pyConsole01;
