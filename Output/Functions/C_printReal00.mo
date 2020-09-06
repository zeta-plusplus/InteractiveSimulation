within InteractiveSimulation.Output.Functions;

function C_printReal00
  extends Modelica.Icons.Function;
  
  input Real variable;
  
  external "C" printReal00(variable) annotation(
    Include = "#include \"printReal00.c\"",
    IncludeDirectory = "modelica://InteractiveSimulation/Output/Functions");
    
end C_printReal00;
