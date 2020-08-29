within InteractiveSimulation.Output.Functions;

function C_printVariablesListOverwrite00
  input String variableName[:];
  input Real variable[:];
  
  external "C" printVariablesListOverwrite00(variableName, size(variableName, 1), variable, size(variable, 1)) annotation(
    Include = "#include \"printVariablesListOverwrite00.c\"",
    IncludeDirectory = "modelica://InteractiveSimulation/Output/Functions");
    
end C_printVariablesListOverwrite00;
