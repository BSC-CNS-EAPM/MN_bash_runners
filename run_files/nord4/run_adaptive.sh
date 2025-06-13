#!/bin/bash
#SBATCH --job-name eq_Patch2_PELE
#SBATCH --output=logs/%x_%j.out
#SBATCH --error=logs/%x_%j.err
#SBATCH --ntasks=41
#SBATCH --time=2:00:00            
#SBATCH -D .
#SBATCH --cpus-per-task=1
#SBATCH --qos=debug
#SBATCH --account=bsc72

module purge

ml intel/2021.4 cmake/3.25.1 impi/2017.4 mkl/2022.3 openblas/0.3.9 boost/1.64.0-mpi
ml miniconda3
eval "$(conda shell.bash hook)"
conda activate /gpfs/projects/bsc72/conda_envs/adaptive

export SCHRODINGER="/gpfs/projects/bsc72/Programs/SCHRODINGER_ACADEMIC"
export SCHRODINGER_PYTHONPATH="/gpfs/projects/bsc72/Programs/SCHRODINGER_ACADEMIC/internal/lib/python2.7/site-packages"
export PELE="/gpfs/projects/bsc72/PELE++/nord4/V1.8.1/PELE-1.8.1_mpi"
export PELE_EXEC="/gpfs/projects/bsc72/PELE++/nord4/V1.8.1/PELE-1.8.1_mpi/PELE-1.8.1"
export SRUN=1  # this is to avoid having to set usesrun: true in input.yaml

echo $PWD
python -m AdaptivePELE.adaptiveSampling ctrl/adEq.conf
