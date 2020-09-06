#include <stdio.h>
#include <string.h>

int runPyScript00(const char *, const char *);

int runPyScript00(const char *dirFullPath,
					const char *scriptName)
{
	char commandLine[256];
	char fullFilePath[256];
	
	
	printf("----- runPyScript00.c -----\n");
	printf("%s\n", dirFullPath);
	printf("%s\n", scriptName);
	printf("\n");
	
	
	memset(fullFilePath, '\0', sizeof(fullFilePath));
	strcat(fullFilePath, dirFullPath);
	strcat(fullFilePath, "\\");
	strcat(fullFilePath, scriptName);
	printf("%s\n", fullFilePath);
	
	
	memset(commandLine, '\0', sizeof(commandLine));
	strcat(commandLine, "start python ");
	strcat(commandLine, fullFilePath);
	printf("%s\n", commandLine);
	system(commandLine);
	
	printf("\n");
	
	printf("----- end runPyScript00.c -----\n");
	
	return 0;
}