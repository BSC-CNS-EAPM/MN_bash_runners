module load ANACONDA/2019.10

eval "$(conda shell.bash hook)"

conda activate /gpfs/projects/bsc72/conda_envs/peleffy/1.3.4/

python -m peleffy.main --help
