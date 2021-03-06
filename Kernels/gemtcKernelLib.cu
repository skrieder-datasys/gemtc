#include <stdio.h>

//This function will return the threadID from 0..31
//This ID is unique within the warp.
//Different from CUDA's ID which is unique within the block
__device__ int gemtcThreadID()
{ 
  return threadIdx.x % 32;
}

//This function will return the warpID of the calling thread
//This number will be unique within the block
__device__ int gemtcWarpID()
{ 
  return threadIdx.x / 32;
}

//SHARED MEMORY MANAGEMENT
__device__ void *SHARED_MEMORY;
__device__ int SHARED_SIZE;
__device__ int WARPS_PER_SM;

__device__ void gemtcInitSharedMemory(void *shared_mem, int mem_size, int warps)
{
  //This needs to initialize the three variables above
  //We need to statically have a large block on Shared Memory
  //  allocated when the program launches to divide
  SHARED_MEMORY = shared_mem;
  SHARED_SIZE = mem_size/warps;
  WARPS_PER_SM = warps;
}

__device__ void *gemtcSharedMemory()
{ 
  return ((char *)SHARED_MEMORY) + SHARED_SIZE*gemtcWarpID()/WARPS_PER_SM;
}
