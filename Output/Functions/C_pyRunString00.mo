within InteractiveSimulation.Output.Functions;

function C_pyRunString00
  input String s;
external "C" annotation(Include="
#include <Python.h>

void pyRunString(const char *str)
{
  Py_SetProgramName(\"pyRunString\");  /* optional but recommended */
  Py_Initialize();
  PyRun_SimpleString(str);
  Py_Finalize();
}
");end C_pyRunString00;
