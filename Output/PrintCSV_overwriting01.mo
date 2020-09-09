within InteractiveSimulation.Output;

block PrintCSV_overwriting01
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
  parameter Integer nVariables = 1 "number of variables";
  parameter String nameFile = "dataOut00.csv";
  parameter String namePath = "modelica://InteractiveSimulation/dataTemp";
  parameter String nameVariables[nVariables] = {"var1"};
  parameter Modelica.SIunits.Time tInterval = 20.0/1000.0 "in [s]";
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
  parameter String nameFilePath = namePath + "/" + nameFile;
  parameter String nameFullFilePath = Files.loadResource(nameFilePath);
  //******************************************************************************************
algorithm
  if initial() == true then
    print("writing csv: " + nameFullFilePath);
  end if;
  dtSincePrevPrint := time - tPrevPrint;
  
  if tInterval <= dtSincePrevPrint then
    dtSincePrevPrint := 0.0;
    tPrevPrint := time;
    Functions.C_printVariablesList2file00(nameFullFilePath, nameVariables, u_variables);
  end if;
//******************************************************************************************
  annotation(
    defaultComponentName = "PrintOnCSV",
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {4, 83}, extent = {{-78, 11}, {78, -19}}, textString = "Print CSV"), Text(origin = {2, 45}, extent = {{-102, 13}, {98, -17}}, textString = "overwtite with interval"), Text(origin = {-12, -79}, extent = {{-88, -1}, {112, -21}}, textString = "%name"), Text(origin = {14, 11}, extent = {{-114, 13}, {86, -7}}, textString = "rev.01")}, coordinateSystem(initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
  
  
end PrintCSV_overwriting01;
