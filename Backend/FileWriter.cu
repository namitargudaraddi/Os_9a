#include "FileWriter.h"
void WriteData(DeviceData gpuData,char *fileName)
{
FILE* fp = fopen(fileName,"w");
if(fp == NULL) 
{
	printf("shared file error\n");
	exit(1);
}


        
else
{
	fprintf(fp,"usedMemory : %d\nfreeMemory : %d\nclockRate : %d\nmpCount : %d\nthreadsPerMp : %d\nsharedMemoryPerMp : %d\nregistersPerMp : %d\nthreadsInWrap : %d\nfanspeed : %d\ntemperature : %d\nthreadsPerBlock : %d\ndeviceName : %s\nMemoryUsage: %d\nGpuUsage: %d",gpuData->usedMemory,gpuData->freeMemory,gpuData->clockRate,gpuData->mpCount,gpuData->threadsPerMp,gpuData->sharedMemoryPerMp,gpuData->registersPerMp,gpuData->threadsInWrap,gpuData->fanspeed,gpuData->temperature,gpuData->threadsPerBlock,gpuData->deviceName,gpuData->memUsage,gpuData->gpuUsage);
		

		
}
fclose(fp);
}
