#include "AuxillaryData.h"
#include <stdio.h>
#include <stdlib.h>

// Main function.
void Extract_AuxillaryData(int *fanspeed,int *temperature,int *totalMemory,int *usedMemory,int *freeMemory)
{
    // Invoking the system command for the nvidia smi and writing the output a temporary file.
    system("nvidia-smi -a>GPU_Data.txt");
   
    // Reading data from the temporary file.
    FILE* data = fopen("GPU_Data.txt","r");
    char dat[4];

    // Error in reading the file.
    if(data==NULL)
    {
        printf("Error");
        exit(1);
    }

    // Extracting fanspeed of the gpu.
    int counter=1;
    char c;

    // Moving the file pointer to the exact location in the file.
    while(counter<29)
    {
     c = fgetc(data);
     if(c=='\n')
     counter++;
    }
    while(c!=':')
    c=fgetc(data);
    c=fgetc(data);
    
    // Reading fan speed.
    counter=0;
    while(c!='\n')
    {
        c=fgetc(data);
        if(c!='\r' && c!='\n' && c!='%')
        dat[counter++]=c;
    }
    *fanspeed=atoi(dat);

    // Reading runtime memory related data.
    while(c!=':')
    c=fgetc(data);
    c=fgetc(data);
    counter=0;

    while(c!='\n')
    {
        c=fgetc(data);
        dat[counter++]=c;
    }
    *totalMemory=atoi(dat);

    while(c!=':')
    c=fgetc(data);
    c=fgetc(data);
    counter=0;

    while(c!='\n')
    {
        c=fgetc(data);
        dat[counter++]=c;
    }
    *usedMemory=atoi(dat);

    while(c!=':')
    c=fgetc(data);
    c=fgetc(data);
    counter=0;
   
    while(c!='\n')
    {
        c=fgetc(data);
        dat[counter++]=c;
    }
    *freeMemory=atoi(dat);

    // Extracting the temperature of the GPU.
    counter=1;
    while(counter<35)
    {
     c = fgetc(data);
     if(c=='\n')
     counter++;
    }
    while(c!=':')
    c=fgetc(data);
    c=fgetc(data);
    
    counter=0;
    while(c!='\n')
    {
        c=fgetc(data);
        dat[counter++]=c;
    }
    *temperature=atoi(dat);
   
    // Deleting the temporary file.
    system("rm GPU_Data.txt");
}
