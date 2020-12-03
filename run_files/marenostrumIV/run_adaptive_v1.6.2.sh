#!/bin/bash

#SBATCH --job-name=JOB_NAME
#SBATCH --output=output_%j.out
#SBATCH --error=output_%j.err
#SBATCH --ntasks=128
#SBATCH --time=00-48:00:00
#SBATCH -D .
#SBATCH --qos=bsc_ls

module purge
module load intel mkl impi python/2.7.13 boost/1.64.0_py2 gcc

export PYTHONPATH=/gpfs/projects/bsc72/adaptiveSampling/bin/v1.6.2/:$PYTHONPATH
export PYTHONPATH=/gpfs/projects/bsc72/lib/site-packages/:$PYTHONPATH

python /gpfs/projects/bsc72/adaptiveSampling/bin/v1.6/AdaptivePELE/adaptiveSampling.py adaptive.conf
