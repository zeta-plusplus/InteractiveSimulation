within InteractiveSimulation.Output.Functions;

function C_printVariablesList2file00
  extends Modelica.Icons.Function;

  input String filePath;
  input String variableName[:];
  input Real variable[:];
  
  external "C" printVariablesList2file00(filePath,
                                       variableName, size(variableName, 1),
                                       variable, size(variable, 1)) 
                                       annotation(
    Include = "#include \"printVariablesList2file00.c\"",
    IncludeDirectory = "modelica://InteractiveSimulation/Output/Functions");
    
end C_printVariablesList2file00;
