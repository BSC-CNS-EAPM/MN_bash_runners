#!/bin/bash

#BSUB -J JOB_NAME
#BSUB -q bsc_ls
#BSUB -W 48:00
#BSUB -eo output_%J.err
#BSUB -oo output_%J.out
#BSUB -n 128

module purge

export PYTHONPATH=/gpfs/projects/bsc72/adaptiveSampling/bin_nord/v1.6/:$PYTHONPATH
export PYTHONPATH=/gpfs/projects/bsc72/lib/site-packages_mn3:$PYTHONPATH

module load intel gcc openmpi/1.8.1 boost/1.63.0 python/2.7.3 MKL/11.3 GTK+3/3.2.4

export MPLBACKEND=Agg
export OMPI_MCA_coll_hcoll_enable=0
export OMPI_MCA_mtl=^mxm

python /gpfs/projects/bsc72/adaptiveSampling/bin_nord/v1.6/AdaptivePELE/adaptiveSampling.py adaptive.conf
