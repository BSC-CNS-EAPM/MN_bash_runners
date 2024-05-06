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

source activate /gpfs/projects/bsc72/conda_envs/platform

export PELE_EXEC=/gpfs/projects/bsc72/PELE++/nord4/V1.8/bin/PELE-1.8
export SCHRODINGER=/gpfs/projects/bsc72/MN4/bsc72/SCHRODINGER_ACADEMIC_NORD


python -m pele_platform.main input.yaml

