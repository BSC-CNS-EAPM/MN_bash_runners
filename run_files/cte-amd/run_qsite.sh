#!/bin/bash
#SBATCH --job-name=Qsite
#SBATCH --output=mpi_%j.out
#SBATCH --error=mpi_%j.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
##SBATCH --qos=bscls
#SBATCH --qos=debug
#SBATCH --time=2:00:00
#SBATCH --constrain=schrodinger

export PATH=$PATH:/gpfs/projects/bsc72/Programs/schrodinger2024-1
export SCHRODINGER=/gpfs/projects/bsc72/Programs/schrodinger2024-1


$SCHRODINGER/qsite -PARALLEL 4 -WAIT e0_t74_st57_en-18.3_dis5.29_1.in

