within InteractiveSimulation.Input;

block AccumulateDigitalInputSignal00
  /********************************************************
              Declaration   
  ********************************************************/
  /* ---------------------------------------------
              parameter   
    --------------------------------------------- */
  parameter Real varInit=0.0 "inital value of y";
  parameter Real scl=1.0 "scale onto u";
  
  
  /* ---------------------------------------------
              internal variable   
    --------------------------------------------- */
  Real uReal;
  discrete Real varAcmltd(fixed=true, start=varInit) annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=true, showStartAttribute=true)
  );
  /* ---------------------------------------------
                Interface   
      --------------------------------------------- */
  output Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input Modelica.Blocks.Interfaces.BooleanInput u annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));  
  
  
  
//********************************************************************************
initial algorithm
  varAcmltd:= varInit;
  
  
//********************************************************************************
algorithm
  uReal := if u then 1.0 else 0.0;
  
  when(pre(u)==false)and(u==true)then
    varAcmltd:= pre(varAcmltd) + uReal*scl;
  end when;
  
  y:= varAcmltd;
  
  annotation(
    defaultComponentName = "Accumulate",
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-100, 100}, {100, -100}}), Text(origin = {2, -72}, extent = {{-100, 0}, {96, -20}}, textString = "%name"), Text(origin = {-3, 49}, extent = {{-85, 23}, {85, -23}}, textString = "Accumulate"), Text(origin = {-1, 5}, extent = {{-85, 23}, {85, -23}}, textString = "Digital Signal"), Text(origin = {9, -47}, extent = {{-85, 23}, {57, -7}}, textString = "type 00")}, coordinateSystem(initialScale = 0.1)));
  
  


end AccumulateDigitalInputSignal00;
