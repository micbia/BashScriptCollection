#!/bin/bash

cd ../source_threads

rm -f cubep3m_dm

make -f Makefile_Cobra clean
make -f Makefile_Cobra NEUTRINOS=0
echo
echo "COMPILED DARK MATTER EXECUTABLE"
echo
#make clean
#make -f Makefile
#echo
#echo "COMPILED DARK MATTER PLUS NEUTRINO EXECUTABLE"
#echo

cd ../batch

