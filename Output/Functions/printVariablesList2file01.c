#include <stdio.h>

int printVariablesList2file01(const char *,
							const char **, int,
							const double *, int,
							double, double, double,
							
							double *,int *);

int printVariablesList2file01(const char *filePath,
						const char **str, int nSizeStr,
						const double *variable, int nSizeVariable,
						double time, double tInterval, double dtSincePrevPrint,
						
						double *tPrevPrint_out, int *flagPrinted)
{
	int i;
	FILE *filePtr;
	//double dtSincePrevPrint;
	
	
	//dtSincePrevPrint= time - tPrevPrint_in;
	(*flagPrinted)=0;
	
	if(tInterval<=dtSincePrevPrint)
	{
		
		
		(*tPrevPrint_out)= time;
		
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
		(*flagPrinted)=1;
	}
	else
	{
		if(0<dtSincePrevPrint)
		{
			(*tPrevPrint_out)=time-dtSincePrevPrint;
		}
		else
		{
			(*tPrevPrint_out)=time;
		}
		
		(*flagPrinted)=0;
	}
	return 0;
}