#!/bin/bash
# Usage
# sbatch -J job-name runner fasta

#SBATCH --job-name=AF23_monomer
#SBATCH --output=logs/%j.out
#SBATCH --error=logs/%j.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=20
#SBATCH --time=48:00:00
#SBATCH --gres=gpu:1
#SBATCH --account=bsc72
#SBATCH -D .
#SBATCH --qos=acc_bscls

module purge
module load singularity alphafold/2.3.2 cuda
#export SRUN_CPUS_PER_TASK=${SLURM_CPUS_PER_TASK}

DIR=$(pwd)

bsc_alphafold \
	--fasta_paths=$DIR/${1} \
	--output_dir=$DIR \
	--model_preset=monomer \
	--max_template_date=2024-01-31 \
	--use_gpu_relax=False

