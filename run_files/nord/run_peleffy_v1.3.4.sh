module load ANACONDA/3-2020.02 

eval "$(conda shell.bash hook)"

conda activate /gpfs/projects/bsc72/conda_envs/peleffy/1.3.4_nord/

python -m peleffy.main --help
