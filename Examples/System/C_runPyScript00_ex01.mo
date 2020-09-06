within InteractiveSimulation.Examples.System;

model C_runPyScript00_ex01
  extends Modelica.Icons.Example;
  
  import InteractiveSimulation.System.Functions;
  import Modelica.Utilities.Files;
  
  
  parameter String nameFile = "pyConsole02.py";
  parameter String namePath = "modelica://InteractiveSimulation/Output";
  
  parameter String nameFullPath= Files.loadResource(namePath);
  parameter String nameFilePath = namePath + "/" + nameFile;
  parameter String nameFullFilePath = Files.loadResource(nameFilePath);
  
  
//******************************************************************************************
initial algorithm
  Functions.C_runPyScript00(nameFullPath, nameFile);
  
  
annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
    
    
end C_runPyScript00_ex01;
