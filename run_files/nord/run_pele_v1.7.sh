#!/bin/bash

#BSUB -J JOB_NAME
#BSUB -q bsc_ls 
#BSUB -W 48:00
#BSUB -eo output_%J.err
#BSUB -oo output_%J.out
#BSUB -n 64

module purge
module load intel gcc openmpi/1.8.1 boost/1.63.0 python/2.7.3 MKL/11.3 GTK+3/3.2.4

export MPLBACKEND=Agg
export OMPI_MCA_coll_hcoll_enable=0
export OMPI_MCA_mtl=^mxm

mpirun -n 64 /gpfs/projects/bsc72/PELE++/nord/V1.7/bin/PELE-1.7_mpi pele.conf
