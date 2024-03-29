#!/bin/bash
#SBATCH --job-name=test
#SBATCH --output=mpi_%j.out
#SBATCH --error=mpi_%j.err
#SBATCH --ntasks=4
#SBATCH --time=00-2:00:00
#SBATCH --qos=debug

module load ANACONDA/2019.10
module load intel mkl impi gcc # 2> /dev/null
module load impi
module load boost/1.64.0

eval "$(conda shell.bash hook)"

conda activate /gpfs/projects/bsc72/conda_envs/platform/1.6.3

python -m frag_pele.main -sef serie_file.conf -cp 1w7h_preparation_structure_no_w.pdb --cpus 4 -x 2 -es 10 -rot 10 -ff OPLS2005

