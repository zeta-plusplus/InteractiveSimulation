within InteractiveSimulation.Output.Functions;

function C_printStr01
  extends Modelica.Icons.Function;

  input String str[:];
  external "C" printStr01(str, size(str,1)) annotation(
    Include = "#include \"printStr01.c\"",
    IncludeDirectory = "modelica://InteractiveSimulation/Output/Functions");
  
end C_printStr01;
