within InteractiveSimulation.Output.Functions;

function C_printReal00
  input Real variable;
  
  external "C" printReal00(variable) annotation(
    Include = "#include \"printReal00.c\"",
    IncludeDirectory = "modelica://InteractiveSimulation/Output/Functions");
    
end C_printReal00;
