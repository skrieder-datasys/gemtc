#include <stdio.h>
__device__ void VecAdd ( void* param1)
{
   float* mem = (float*)param1;
   int size = (int)mem[0];
   float* A = mem+1;
   float* B = A+size;
   float* C = B+size;
   int warp_size = 32;
   int tid = threadIdx.x;
   //printf("%d,%d\n",size, threadIdx.x);
   //C[tid] = A[tid] + B[tid];
   while (tid < size)
   {
      C[tid] = A[tid] + B[tid];
      //printf("%d=%d\n", tid, C[tid]);
      tid = tid + warp_size;
   }

#if 0 
   int* A = (int*)param1;
   int* B = (int*)param1;
   int* C = (int*)param1;

   int tid = threadIdx.x + blockIdx.x*blockDim.x;

   while (tid < 32) {
      C[tid] = A[tid] + B[tid];
      tid += blockDim.x*gridDim.x;
   }
#endif
}
