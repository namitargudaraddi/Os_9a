#include "FileWriter.h"
void WriteData(DeviceData data)
{
	char *userName;
	userName=(char *)malloc(sizeof(char)*strlen(getenv("HOME")));
	strcpy(userName,getenv("HOME"));
	printf("%s",userName);
}
