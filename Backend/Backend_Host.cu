#include "GlobalStruct.h"
#include "GetDeviceData.h"
#include "AuxillaryData.h"
#include "FileWriter.h"

int main()
{
	char *fullFilePath;
	fullFilePath=(char *)malloc(sizeof(char)*(strlen(getenv("HOME"))+10));
	strcpy(fullFilePath,getenv("HOME"));
	strcat(fullFilePath,"/Data.txt\0");
	while(1)
	{
	DeviceData gpuData = GetDeviceInformation();
	Extract_AuxillaryData(&(gpuData->fanspeed),&(gpuData->temperature),&(gpuData->totalMemory),&(gpuData->usedMemory),&(gpuData->freeMemory),&(gpuData->gpuUsage),&(gpuData->memUsage));
	WriteData(gpuData,fullFilePath);
	}
}
