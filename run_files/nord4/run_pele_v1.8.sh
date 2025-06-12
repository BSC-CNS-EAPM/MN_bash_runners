#!/bin/bash 
#SBATCH -J example
#SBATCH --output=output_%J.out
#SBATCH --error=output_%J.err
#SBATCH --qos=debug
#SBATCH --time=00:05:00
#SBATCH --ntasks=5

module purge

ml intel/2021.4 cmake/3.25.1 impi/2017.4 mkl/2022.3 openblas/0.3.9 boost/1.64.0-mpi

mpirun -np 5 /gpfs/projects/bsc72/PELE++/nord4/V1.8.1/PELE-1.8.1_mpi/PELE-1.8.1 --control-file pele.conf

