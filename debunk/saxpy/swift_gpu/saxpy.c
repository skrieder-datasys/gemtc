#include <stdio.h>
#include "saxpy.h"


int c_saxpy(int i){

  printf("Calling sleep_wrapper\n");
  cuda_saxpy_launcher(1000, 1);
  printf("End sleep_wrapper\n");

  return 0;
}
