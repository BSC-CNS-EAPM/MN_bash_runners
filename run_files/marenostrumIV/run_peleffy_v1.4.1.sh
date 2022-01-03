#!/bin/bash
#SBATCH --job-name=peleffy
#SBATCH --output=peleffy.out
#SBATCH --error=peleffy.err
#SBATCH --ntasks=2
#SBATCH --qos=debug
#SBATCH --time=00-00:30:00

module purge

module load ANACONDA/2019.10
module load intel mkl impi gcc # 2> /dev/null
module load impi
module load boost/1.64.0

eval "$(conda shell.bash hook)"

conda activate /gpfs/projects/bsc72/conda_envs/platform/1.6.2

python -m peleffy.main ligand_to_parametrize.pdb -f OPLS2005

