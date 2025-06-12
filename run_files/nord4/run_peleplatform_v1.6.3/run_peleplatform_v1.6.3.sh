#!/bin/bash
#SBATCH --job-name=PELE
#SBATCH --output=PELE.out
#SBATCH --error=PELE.err
#SBATCH --ntasks=50
#SBATCH --qos=debug
#SBATCH --time=00-01:00:00

module purge

module load anaconda

ml intel/2021.4 cmake/3.25.1 impi/2017.4 mkl/2022.3 openblas/0.3.9 boost/1.64.0-mpi

eval "$(conda shell.bash hook)"

source activate /gpfs/projects/bsc72/conda_envs/platform

export PELE_EXEC=/gpfs/projects/bsc72/PELE++/nord4/V1.8.1/PELE-1.8.1_mpi/PELE-1.8.1
export SCHRODINGER=/gpfs/projects/bsc72/Programs/SCHRODINGER_ACADEMIC_NORD


python -m pele_platform.main input.yaml

