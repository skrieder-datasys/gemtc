#include <stdlib.h>
#include "Queue.h"

////////////////////////////////////////////////////////////
// Constructor and Deconsturctor
////////////////////////////////////////////////////////////

Queue CreateQueue(int MaxElements) {
   Queue Q = (Queue) malloc (sizeof(struct QueueRecord));

  //Q->Array = (JobPointer *) gemtcMalloc(sizeof(JobPointer)*MaxElements);
   Q->Array = (JobPointer *) malloc(sizeof(JobPointer)*MaxElements);
  
   Q->Capacity = MaxElements;
   Q->Front = 1;
   Q->Rear = 0;
   Q->ReadLock = 0;

  // NEED TO DO A MEMCOPY HERE
  /*Queue d_Q = (Queue) gemtcMalloc(sizeof(struct QueueRecord));
  cudaSafeMemcpy(d_Q, Q, sizeof(struct QueueRecord), 
                 cudaMemcpyHostToDevice, stream_dataIn, 
                 "Copying initial queue to device");
  free(Q);*/
  
  return d_Q;
}

void DisposeQueue(Queue Q) {
  free(Q->Array);
  //pthread_mutex_destroy(&Q->WriteLock);
  free(Q);
}

////////////////////////////////////////////////////////////
// Host Functions to Change Queues
////////////////////////////////////////////////////////////

void EnqueueJob(JobPointer h_JobDescription, Queue Q) {
//called by CPU

   if (IsFull(Q)) {
      printf ("Enqueue error: Queue is full!");
      return;
   }
   
   // floating point exception from mod capacity if 0 or -n
   int temp = (Q->Rear+1)%(Q->Capacity);
    
   // set job description
   Q->Array[temp] = jobDescription;
   Q->Rear = temp;

   return;
}

JobPointer MaybeFandD(Queue Q){

  if(IsEmpty(Q)){
    return NULL;
  }else{
    JobPointer result = (JobPointer) malloc(sizeof(JobPointer));
    *result = Q->Array[Q->Front];
    Q->Front = (Q->Front+1)%(Q->Capacity);
    return result;
  }
}





































