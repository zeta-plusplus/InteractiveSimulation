#include <stdlib.h>
#include <stdio.h>

int printVariablesListOverwrite00(const char **, int,
								const double *, int);

int printVariablesListOverwrite00(const char **str, int nSizeStr,
						const double *variable, int nSizeVariable)
{
	int i;
	
	if(nSizeStr==nSizeVariable)
	{
		
		//system("cls");
		printf("\r");
		for(i=0; i<nSizeStr; i++)
		{
			printf("%s,", *str);
			printf("%lf\n", variable[i]);
			str++;
		}
	}
	else
	{
		printf("error, printVariablesList00: nSizeStr!=nSizeVariable");
	}
	return 0;
}