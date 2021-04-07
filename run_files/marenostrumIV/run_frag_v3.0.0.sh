#!/bin/bash
#SBATCH --job-name=frag_nu1
#SBATCH --output=frag_%j.out
#SBATCH --error=frag_%j.err
#SBATCH --ntasks=48
#SBATCH --time=00-2:00:00
#SBATCH --qos=debug

module purge
unset PYTHONPATH
export SCHRODINGER="/gpfs/projects/bsc72/SCHRODINGER_ACADEMIC"
export PATH=/gpfs/projects/bsc72/conda_envs/FragPELE/v3.0.0/bin:$PATH
export PYTHONPATH="/gpfs/projects/bsc72/FragPELE/v3.0.0-beta/frag_pele"

module load intel mkl impi gcc # 2> /dev/null
module load impi
module load boost/1.64.0

python  -m frag_pele.main -sef serie.conf -cp complex.pdb --cpus 48 -x 10 -es 20 --pele_dir /gpfs/projects/bsc72/PELE++/mniv/V1.6.1-MemFix/build/PELE-1.6.1_mpi -c control_template.conf -rot 10
