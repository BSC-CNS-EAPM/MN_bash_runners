#!/bin/bash
#SBATCH --job-name=prepwizard
#SBATCH --output=preplizard_%j.out
#SBATCH --error=prepwizard_%j.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
##SBATCH --qos=bscls
#SBATCH --qos=debug
#SBATCH --time=2:00:00

export PATH=$PATH:/gpfs/projects/bsc72/Programs/schrodinger2024-2
export SCHRODINGER=/gpfs/projects/bsc72/Programs/schrodinger2024-2


$SCHRODINGER//utilities/prepwizard -rehtreat -disulfides -fillloops -fillsidechains -minimize_adj_h -f OPLS_2005 -propka_pH 7.4 -HOST localhost:1 -WAIT dummy.pdb WORKS.pdb
