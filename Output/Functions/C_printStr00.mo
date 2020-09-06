within InteractiveSimulation.Output.Functions;

function C_printStr00
  extends Modelica.Icons.Function;
  
  input String str;
  external "C" printStr00(str) annotation(
    Include = "#include \"printStr00.c\"",
    IncludeDirectory = "modelica://InteractiveSimulation/Output/Functions");
  
end C_printStr00;
