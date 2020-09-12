within InteractiveSimulation.Output.Functions;

function C_printVariablesList2file02
  extends Modelica.Icons.Function;

  input String filePath;
  input String variableName[:];
  input Real variable[:];
  input Real t;
  input Real tInterval;
  input Real dtSincePrevPrint;
  output Real tPrevPrint_out;
  output Boolean flagPrinted;
  
  external "C" printVariablesList2file02(filePath,
                                       variableName, size(variableName, 1),
                                       variable, size(variable, 1),
                                       t, tInterval, dtSincePrevPrint,
                                       
                                       tPrevPrint_out, flagPrinted)
                                       annotation(
    Include = "#include \"printVariablesList2file02.c\"",
    IncludeDirectory = "modelica://InteractiveSimulation/Output/Functions");
    
end C_printVariablesList2file02;
