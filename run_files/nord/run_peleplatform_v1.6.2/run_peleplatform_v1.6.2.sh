#!/bin/bash
#BSUB -J JOB_NAME
#BSUB -q bsc_ls 
#BSUB -W 48:00
#BSUB -eo output_%J.err
#BSUB -oo output_%J.out
#BSUB -n 64

module purge

module load ANACONDA/2020.11
module load intel gcc openmpi/1.8.1 boost/1.63.0 MKL/11.3 GTK+3/3.2.4

eval "$(conda shell.bash hook)"

conda activate /gpfs/projects/bsc72/conda_envs/platform/1.6.2_nord

python -m pele_platform.main input.yaml
