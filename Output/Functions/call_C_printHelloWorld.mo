within InteractiveSimulation.Output.Functions;

function call_C_printHelloWorld
  extends Modelica.Icons.Function;
  
  external "C" printHelloWorld() annotation(
    Include = "#include \"printHelloWorld.c\"",
    IncludeDirectory = "modelica://InteractiveSimulation/Output/Functions");
    
    
end call_C_printHelloWorld;
