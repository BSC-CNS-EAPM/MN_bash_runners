#!/bin/bash

#SBATCH --job-name=JOB_NAME
#SBATCH --output=output_%j.out
#SBATCH --error=output_%j.err
#SBATCH --ntasks=96
#SBATCH --time=00-48:00:00
#SBATCH -D .
#SBATCH --qos=bsc_ls

module purge
module load intel mkl python/3.6.1 impi boost/1.64.0_py3 gcc

mpirun -n 96 /gpfs/projects/bsc72/PELE++/mniv/V1.7/bin/PELE-1.7_mpi pele.conf
