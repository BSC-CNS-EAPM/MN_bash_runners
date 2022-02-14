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

python -m frag_pele.main -sef serie_file.conf -cp 1w7h_preparation_structure_no_w.pdb --cpus 4 -x 2 -es 10 -rot 10 -ff OPLS2005

