#!/bin/bash

#SBATCH --job-name=JOB_NAME
#SBATCH --output=output_%j.out
#SBATCH --error=output_%j.err
#SBATCH --ntasks=96
#SBATCH --time=00-48:00:00
#SBATCH -D .
#SBATCH --qos=gp_bscls
##SBATCH --qos=gp_debug

module purge
module load intel mkl impi anaconda/2023.07 bsc cmake

mpirun -n 96 /gpfs/projects/bsc72/PELE++/mnv/1.8.0/bin/PELE-1.8_mpi pele.conf
