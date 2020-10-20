#!/bin/sh
#SBATCH --job-name=ramsesLSF
#SBATCH --nodes=56
#SBATCH --ntasks-per-node=10
#SBATCH --cpus-per-task=4
#SBATCH --ntasks-per-core=1

#SBATCH --account=subgridEoRevol
#SBATCH --partition=ProdQ
#SBATCH --time=72:00:00

#SBATCH --output=msg/subgrid_gas-out.%j
#SBATCH --error=msg/subgrid_gas-err.%j
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mb756@sussex.ac.uk

module load openmpi/gcc/3.1.2	# for ramses-rt3d

#export PSM2_MQ_RECVREQS_MAX=$((1048576 * $SLURM_NPROCS / 56))
#echo ${PSM2_MQ_RECVREQS_MAX}
echo ${SLURM_NPROCS}

mpirun -n ${SLURM_NPROCS} $HOME/codes/ramses/bin/ramses-rt3d subgridgas.nml
