#!/bin/bash
#SBATCH --job-name=PELE
#SBATCH --output=PELE.out
#SBATCH --error=PELE.err
#SBATCH --ntasks=5    # change this value to match CPUs in input.yaml
#SBATCH --qos=debug
#SBATCH --time=00-01:00:00

module purge

module load anaconda
module load intel impi mkl boost cmake transfer bsc

eval "$(conda shell.bash hook)"

conda activate /gpfs/projects/bsc72/conda_envs/platform/1.6.3

python -m AdaptivePELE.adaptiveSampling adaptive.conf

