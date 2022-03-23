#!/bin/bash

#SBATCH --job-name=JOB_NAME
#SBATCH --output=output_%j.out
#SBATCH --error=output_%j.err
#SBATCH --ntasks=96
#SBATCH --time=00-48:00:00
#SBATCH -D .
#SBATCH --qos=bsc_ls

module purge
module load intel mkl impi python/2.7.13 boost/1.64.0 bsc cmake

mpirun -n 96 /gpfs/projects/bsc72/PELE++/mniv/V1.8_pre/bin/PELE-1.8_mpi pele.conf
