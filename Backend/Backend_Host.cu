#include "GlobalStruct.h"
#include "GetDeviceData.h"
#include "AuxillaryData.h"

int main()
{
	DeviceData gpuData = GetDeviceInformation(gpuData);
	Extract_AuxillaryData(&(gpuData->fanspeed),&(gpuData->temperature),&(gpuData->totalMemory),&(gpuData->usedMemory),&(gpuData->freeMemory));
	printf("\nFanspeed:: %d\nTotal memory:: %dMB\nUsed memory:: %dMB\nFree memory:: %dMB\nTemperature:: %d\n",gpuData->fanspeed,gpuData->totalMemory,gpuData->usedMemory,gpuData->freeMemory,gpuData->temperature);
	printf("Device Name:: %s",gpuData->deviceName);
}
