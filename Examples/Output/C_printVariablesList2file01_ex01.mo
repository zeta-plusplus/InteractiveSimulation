within InteractiveSimulation.Examples.Output;

model C_printVariablesList2file01_ex01
  extends Modelica.Icons.Example;
  import InteractiveSimulation.Output.Functions;
  import Modelica.Utilities.Files;
  /* ---------------------------------------------
                parameters
   --------------------------------------------- */
  parameter String namePath = "modelica://InteractiveSimulation/dataTemp";
  parameter String nameFile = "dataOut00.csv";
  parameter String str[2] = {"time[s]", "sin(time)[nond]"};
  parameter Modelica.SIunits.Time tInterval = 1000 / 1000 "in [s]";
  
  
  /* ---------------------------------------------
              Internal variables
   --------------------------------------------- */
  discrete Integer nPrinted;
  Real var[2];
  
  /* ---------------------------------------------
              Internal objects
   --------------------------------------------- */
  Modelica_DeviceDrivers.Blocks.OperatingSystem.SynchronizeRealtime synchronizeRealtime1 annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //******************************************************************************************
protected
  parameter String nameFilePath = namePath + "/" + nameFile;
  parameter String nameFullFilePath = Files.loadResource(nameFilePath);
  //******************************************************************************************
initial algorithm
  nPrinted:=0;
  
  //******************************************************************************************
algorithm
  var[1] := time;
  var[2] := sin(time);
  
  when(sample(tInterval, tInterval))then
    (nPrinted):=Functions.C_printVariablesList2file01(nameFullFilePath, str, var, pre(nPrinted));
  end when;
  
//******************************************************************************************
  annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end C_printVariablesList2file01_ex01;
