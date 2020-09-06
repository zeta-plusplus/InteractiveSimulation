within InteractiveSimulation.System.Functions;

function C_runPyScript00
  extends Modelica.Icons.Function;
  input String dirFullPath;
  input String scriptName;
  
  external "C" runPyScript00(dirFullPath, scriptName) annotation(
    Include = "#include \"runPyScript00.c\"",
    IncludeDirectory = "modelica://InteractiveSimulation/System/Functions");
  
  
end C_runPyScript00;
