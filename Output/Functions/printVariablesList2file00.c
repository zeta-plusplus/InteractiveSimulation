#include <stdio.h>

int printVariablesList2file00(const char *,
							const char **, int,
							const double *, int);

int printVariablesList2file00(const char *filePath,
						const char **str, int nSizeStr,
						const double *variable, int nSizeVariable)
{
	int i;
	FILE *filePtr;
	
	filePtr= fopen(filePath,"w");
	
	if(filePtr==NULL)
	{
		printf("failed to open file\n");
		printf("file path: %s\n", filePath);
	}
	else
	{
		if(nSizeStr==nSizeVariable)
		{
			for(i=0; i<nSizeStr; i++)
			{
				fprintf(filePtr, "%s,", *str);
				fprintf(filePtr, "%lf\n", variable[i]);
				str++;
			}
		}
		else
		{
			printf("error, printVariablesList00: nSizeStr!=nSizeVariable");
		}
	}
	
	fclose(filePtr);
	return 0;
}