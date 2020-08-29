within InteractiveSimulation.Examples.Temp;

model C_printVariablesList2file00_temp01
  extends Modelica.Icons.Example;
  
  import InteractiveSimulation.Output.Functions;
  import Modelica.Utilities.Files;
  
  /* ---------------------------------------------
            parameters
   --------------------------------------------- */
  parameter String namePath= "modelica://InteractiveSimulation/dataTemp";
  parameter String nameFile= "dataOut00.csv";
  
  parameter String str[2] = {"time[s]", "sin(time)[nond]"};
  parameter Modelica.SIunits.Time tInterval = 20/1000 "in [s]";
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
  Real var[2];
  Modelica_DeviceDrivers.Blocks.OperatingSystem.SynchronizeRealtime synchronizeRealtime1 annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

//******************************************************************************************    
protected
  parameter String nameFilePath = namePath + "/" + nameFile;
  parameter String nameFullFilePath = Files.loadResource(nameFilePath);

//******************************************************************************************
algorithm
  var[1] := time;
  var[2] := sin(time);
  dtSincePrevPrint := time - tPrevPrint;
  if tInterval <= dtSincePrevPrint then
    dtSincePrevPrint := 0.0;
    tPrevPrint := time;
    Functions.C_printVariablesList2file00(nameFullFilePath, str, var);
  end if;
  
//******************************************************************************************
  annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end C_printVariablesList2file00_temp01;
