#!/bin/bash
ncore=2
echo 'Number MPI of core', $ncore 
cd ./source/
mpirun -np $ncore ./RT.exe >& ../RT_out_sed3MWA
