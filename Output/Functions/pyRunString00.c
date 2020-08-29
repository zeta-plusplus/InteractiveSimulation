#include <stdio.h>
#include <Python.h>

int pyRunString00(const char *);

int pyRunString00(const char *str)
{
	//Py_SetProgramName(\"pyRunString\");
	Py_Initialize();
	PyRun_SimpleString(str);
	Py_Finalize();
	return 0;
}
