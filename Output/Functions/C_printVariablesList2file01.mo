within InteractiveSimulation.Output.Functions;

function C_printVariablesList2file01
  extends Modelica.Icons.Function;
  //***********************************
  input String filePath;
  input String variableName[:];
  input Real variable[:];
  input Integer nPrinted_in;
  //***********************************
  output Integer nPrinted_out;
  //***********************************
  external "C" printVariablesList2file01(filePath,
                                       variableName, size(variableName, 1),
                                       variable, size(variable, 1),
                                       nPrinted_in,
                                       
                                       nPrinted_out)
                                       annotation(
    Include = "#include \"printVariablesList2file01.c\"",
    IncludeDirectory = "modelica://InteractiveSimulation/Output/Functions");
    
end C_printVariablesList2file01;
