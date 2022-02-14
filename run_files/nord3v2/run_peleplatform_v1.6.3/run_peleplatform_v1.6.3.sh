#!/bin/bash
#SBATCH --job-name=PELE
#SBATCH --output=PELE.out
#SBATCH --error=PELE.err
#SBATCH --ntasks=50
#SBATCH --qos=debug
#SBATCH --time=00-01:00:00

module purge

module load anaconda
module load intel impi mkl boost cmake transfer bsc

eval "$(conda shell.bash hook)"

conda activate /gpfs/projects/bsc72/conda_envs/platform/1.6.3

python -m pele_platform.main input.yaml

