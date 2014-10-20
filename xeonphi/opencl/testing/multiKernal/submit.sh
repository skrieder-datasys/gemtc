#!/bin/bash
#
#$ -cwd
#$ -j y
#$ -P cs451_s14_project
#$ -m n
#$ -pe mpich 1
#$ -S /bin/bash
#
/usr/bin/time -f "%e" ./mult 2 1 512 40960
/usr/bin/time -f "%e" ./mult 1 1 512 40960
#/usr/bin/time -f "%e" ./mvect 2 4 512 6000000
#/usr/bin/time -f "%e" ./mkvect 2 512 6000000
