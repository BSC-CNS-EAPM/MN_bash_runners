#!/bin/bash
#SBATCH --job-name=test
#SBATCH --output=mpi_%j.out
#SBATCH --error=mpi_%j.err
#SBATCH --ntasks=4
#SBATCH --time=00-2:00:00
#SBATCH --qos=debug

module purge 
module load ANACONDA/2019.10
module load intel mkl impi gcc # 2> /dev/null
module load impi
module load boost/1.64.0

eval "$(conda shell.bash hook)"

conda activate /gpfs/projects/bsc72/conda_envs/platform/1.6.0

unset PYTHONPATH
export PYTHONPATH="/gpfs/projects/bsc72/LibPrep/v1.1.1/lib_prep:/gpfs/projects/bsc72/FragPELE/v3.1.1-beta/frag_pele"
