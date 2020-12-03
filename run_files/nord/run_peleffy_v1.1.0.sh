module load ANACONDA/3-2020.02 

eval "$(conda shell.bash hook)"

conda activate /gpfs/projects/bsc72/conda_envs/peleffy/1.1.0/

python -m peleffy.main --help
