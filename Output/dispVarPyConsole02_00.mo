within InteractiveSimulation.Output;

block dispVarPyConsole02_00
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
  parameter Integer nVariables = 1 "number of variables";
  parameter String nameFileDataCSV = "dataOut00.csv";
  parameter String namePathDataCSV = "modelica://InteractiveSimulation/dataTemp";
  
  parameter String nameFilePyScript = "pyConsole02.py";
  parameter String namePathPyScript = "modelica://InteractiveSimulation/Output";
  
  parameter String nameVariables[nVariables] = {"var1"};
  parameter Modelica.SIunits.Time tInterval = 100.0 / 1000.0 "in [s]";
  //********** Initialization Parameters **********
  parameter Modelica.SIunits.Time tPrevPrint_init = 0.0 "" annotation(
    Dialog(tab = "Initialization"));
  parameter Modelica.SIunits.Time dtSincePrevPrint_init = 0.0 "" annotation(
    Dialog(tab = "Initialization"));
  /* ---------------------------------------------
          Internal variables
      --------------------------------------------- */
  discrete Modelica.SIunits.Time tPrevPrint(fixed = true, start = tPrevPrint_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.Time dtSincePrevPrint(fixed = true, start = dtSincePrevPrint_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  /* ---------------------------------------------
          Interface
      --------------------------------------------- */
  input Modelica.Blocks.Interfaces.RealInput u_variables[nVariables] annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //******************************************************************************************
protected
  /* ---------------------------------------------
          parameters
  --------------------------------------------- */
  parameter String nameFilePathDataCSV = namePathDataCSV + "/" + nameFileDataCSV;
  parameter String nameFullFilePathDataCSV = Files.loadResource(nameFilePathDataCSV);
  
  parameter String nameFullPathPyScript = Files.loadResource(namePathPyScript);
  parameter String nameFilePathPyScript = namePathPyScript + "/" + nameFilePyScript;
  parameter String nameFullFilePathPyScript = Files.loadResource(nameFilePathPyScript);
  
  
  //******************************************************************************************
initial algorithm
  //----- display inputs on command line -----
  Streams.print("writing csv: " + nameFullFilePathDataCSV);
  Streams.print("full path: " + nameFullPathPyScript);
  Streams.print("script name: " + nameFilePyScript);
  Streams.print("script full file path: " + nameFullFilePathPyScript);
  //----- execute python script -----
  System.setEnvironmentVariable("PATH", namePythonPath, true);
  System.command("start python "+nameFullFilePathPyScript);
  
  
//******************************************************************************************
algorithm
  
  dtSincePrevPrint := time - tPrevPrint;
  if (tInterval <= dtSincePrevPrint) then
    dtSincePrevPrint := 0.0;
    tPrevPrint := time;
    Functions.C_printVariablesList2file00(nameFullFilePathDataCSV, nameVariables, u_variables);
  end if;
//******************************************************************************************
  annotation(
    defaultComponentName = "dispVarPyConsole",
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {2, 61}, extent = {{-102, 19}, {98, -17}}, textString = "pyConsole02"), Text(origin = {-12, -77}, extent = {{-88, -1}, {112, -21}}, textString = "%name"), Text(origin = {2, 27}, extent = {{-102, 13}, {98, -7}}, textString = "rev.00")}, coordinateSystem(initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end dispVarPyConsole02_00;
