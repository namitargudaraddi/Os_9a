#include "GetDeviceData.h"
#include <cuda.h>

DeviceData GetDeviceInformation()
{
	// Device properties.
	DeviceData gpuData;
	cudaDeviceProp gpuDeviceProperties;
	int deviceCount,i;
	
	// Getting devices count.
	cudaGetDeviceCount(&deviceCount);
	
	for(i=0;i<deviceCount;i++)
	{
		// Initializing gpuData variable.
		gpuData = (struct deviceData*)malloc(sizeof(struct deviceData));

		// Getting the device data.
		
		// Getting device name.
		cudaGetDeviceProperties(&gpuDeviceProperties, i);
		gpuData->deviceName = (char*)malloc(sizeof(char)*strlen(gpuDeviceProperties.name));
		strcpy(gpuData->deviceName,gpuDeviceProperties.name);
		//printf("name:: %s\n",gpuData->deviceName);
		
		// Getting device clock rate.
		gpuData->clockRate=gpuDeviceProperties.clockRate;
		
		// Getting device memory information.
		gpuData->totalMemory = (gpuDeviceProperties.totalGlobalMem)/1000;
		gpuData->registersPerMp= gpuDeviceProperties.regsPerBlock;		
		gpuData->threadsPerBlock= gpuDeviceProperties.maxThreadsPerBlock;
		gpuData->threadsInWrap= gpuDeviceProperties.warpSize;
		gpuData->mpCount=gpuDeviceProperties.multiProcessorCount;
		gpuData->sharedMemoryPerMp =gpuDeviceProperties.sharedMemPerBlock;
		gpuData->threadsPerBlock = gpuDeviceProperties.maxThreadsPerBlock;

	}
	return gpuData;
}
