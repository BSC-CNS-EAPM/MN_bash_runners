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
ml intel/2023.2.0
ml cmake/3.25.1
ml impi/2021.10.0
ml mkl/2023.2.0
ml boost/1.77.0-gcc

mpirun -n 96 /gpfs/projects/bsc72/PELE++/mnv/1.8.0/bin/PELE-1.8_mpi_intel pele.conf
