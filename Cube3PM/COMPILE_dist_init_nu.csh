cd ../utils/dist_init

# Library links
P3DFFT_LIB=/u/ciardi/cubep3m_clean/p3dfft.2.5.1_fix/lib
P3DFFT_INC=/u/ciardi/cubep3m_clean/p3dfft.2.5.1_fix/include

TACC_FFTW3_LIB=$FFTW_HOME/lib
TACC_FFTW3_INC=$FFTW_HOME/include

rm -f dist_init_dmnu_dm
rm -f dist_init_dmnu_nu

mpiifort -shared-intel -mcmodel=medium -qopenmp -fpp -g -O3 -xhost dist_init_dmnu.f90 -I$TACC_FFTW3_INC -I$P3DFFT_INC -o dist_init_dmnu_dm -L$TACC_FFTW3_LIB -L$P3DFFT_LIB -lp3dfft -lfftw3f
#mpiifort -shared-intel -mcmodel=medium -qopenmp -fpp -g -O3 -xhost -DZIP dist_init_dmnu.f90 -I$TACC_FFTW3_INC -I$P3DFFT_INC -o dist_init_dmnu_dm -L$TACC_FFTW3_LIB -L$P3DFFT_LIB -lp3dfft -lfftw3f
#mpif90 -shared-intel -mcmodel=medium -openmp -fpp -g -O3 -xhost -DDEBUG_LOW dist_init_dmnu.f90 -I$TACC_FFTW3_INC -I$P3DFFT_INC -o dist_init_dmnu_dm -L$TACC_FFTW3_LIB -L$P3DFFT_LIB -lp3dfft -lfftw3f
#mpif90 -shared-intel -mcmodel=medium -openmp -fpp -g -O3 -xhost -DVELTRANSFER -DNEUTRINOS dist_init_dmnu.f90 -I$TACC_FFTW3_INC -I$P3DFFT_INC -o dist_init_dmnu_nu -L$TACC_FFTW3_LIB -L$P3DFFT_LIB -lp3dfft -lfftw3f

cd ../../batch

echo "Sourced dist_init_p3dfft.csh"

