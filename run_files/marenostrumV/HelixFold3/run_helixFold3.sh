#!/bin/bash
#SBATCH --job-name=HF3_PL
#SBATCH --output=acc_report_%j.out
#SBATCH --error=acc_report_%j.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=20
#SBATCH --time=1:00:00
#SBATCH --gres=gpu:1
#SBATCH --account=bsc72
#SBATCH -D .
#SBATCH --qos=acc_bscls

module purge
module load cuda/12.1 cudnn/8.8.0-cuda12 openmpi/4.1.5-gcc anaconda/2024.02
source activate helixfold3
export SLURM_CPU_BIND=none
#export OMP_NUM_THREADS=1

# !!!REMEMBER TO CHANGE THE TEMPLATE DATE, INPUT JSON AND OUTPUT DIR!!!
mpirun -np 1 --bind-to none bsc_helixfold --max_template_date=2020-05-14 \
    --input_json sample.json \
    --output_dir ./your_our_dir \
    --model_name allatom_demo \
    --infer_times 3 \
    --precision "fp32"