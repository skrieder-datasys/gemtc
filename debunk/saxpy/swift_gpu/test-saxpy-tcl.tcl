### USAGE

# 1) Help Tcl find the pkgIndex file:
# export TCLLIBPATH=$PWD
# 2) Help the loader find the other .so and CUDA
# export LD_LIBRARY_PATH=$PWD:$CUDA
#   On Breadboard and skrieder, CUDA is in /usr/local/cuda/lib64
#       export LD_LIBRARY_PATH=$PWD:/usr/local/cuda/lib64

package require saxpy 0.0

### GEMTC
puts GEMTC

c_saxpy 5