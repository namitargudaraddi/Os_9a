#pragma once
#include <stdio.h>
#include <stdlib.h>

struct deviceData
{
        int totalMemory;
        int usedMemory;
        int freeMemory;
        int clockRate;
        int mpCount;
        int threadsPerMp;
        int sharedMemoryPerMp;
        int registersPerMp;
        int threadsInWrap;
        int fanspeed;
        int temperature;
        int threadsPerBlock;
        char *deviceName;
};

typedef struct deviceData *DeviceData;
