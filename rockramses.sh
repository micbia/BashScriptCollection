#!/bin/sh
#SBATCH --job-name=rockstar
##SBATCH --nodes=20
##SBATCH --ntasks-per-node=28
#SBATCH --nodes=56
#SBATCH --ntasks-per-node=10
#SBATCH --cpus-per-task=4
#SBATCH --ntasks-per-core=1

#SBATCH --account=subgridEoRevol
#SBATCH --partition=ProdQ
#SBATCH --time=72:00:00

#SBATCH --output=msg/rockstar-out.%j
#SBATCH --error=msg/rockstar-err.%j
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mb756@sussex.ac.uk

echo ${SLURM_NPROCS}
export OMP_NUM_THREADS=${SLURM_NPROCS}

module load gcc/8.2.0
module load openmpi/gcc/3.1.4

set -x

exe=/ichec/home/users/pr1umich/codes/rockstar-ramses/rockstar

echo Entering $(pwd)

rm auto-rockstar.cfg test-output.dat
#$exe -c ramses.cfg >& server.dat &
$exe -c restart.cfg >& server.dat &

perl -e 'sleep 1 while (!(-e "auto-rockstar.cfg"))'

mpirun -np ${SLURM_NPROCS} $exe -c auto-rockstar.cfg
#srun $exe -c auto-rockstar.cfg
