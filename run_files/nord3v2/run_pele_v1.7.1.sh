#!/bin/bash 
#SBATCH -J example
#SBATCH --output=output_%J.out
#SBATCH --error=output_%J.err
#SBATCH --qos=debug
#SBATCH --time=00:05:00
#SBATCH --ntasks=5

module purge
module load intel impi mkl boost cmake transfer bsc

mpirun -np 5 /gpfs/projects/bsc72/PELE++/nord4/V1.7.1/bin/PELE-1.7.1_mpi --control-file pele.conf

