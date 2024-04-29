#!/bin/bash
#SBATCH --job-name=PELE
#SBATCH --output=PELE.out
#SBATCH --error=PELE.err
#SBATCH --ntasks=50
#SBATCH --qos=gp_debug
#SBATCH --time=00-02:00:00

module load anaconda intel mkl impi bsc transfer # 2> /dev/null

eval "$(conda shell.bash hook)"

conda activate /gpfs/projects/bsc72/conda_envs/platform

python -m pele_platform.main input.yaml

conda deactivate 