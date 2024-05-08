#!/bin/bash
#SBATCH --job-name=PELE
#SBATCH --output=PELE.out
#SBATCH --error=PELE.err
#SBATCH --account=bsc72
#SBATCH --ntasks=50
#SBATCH --qos=gp_debug
#SBATCH --time=00-02:00:00

module purge

ml intel/2023.2.0
ml cmake/3.25.1
ml impi/2021.10.0
ml mkl/2023.2.0
ml boost/1.77.0-gcc
ml anaconda
ml bsc
ml transfer

eval "$(conda shell.bash hook)"

conda activate /gpfs/projects/bsc72/conda_envs/platform

python -m pele_platform.main input.yaml

conda deactivate 