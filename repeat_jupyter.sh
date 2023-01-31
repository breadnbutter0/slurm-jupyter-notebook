#!/bin/sh
#SBATCH --job-name=repeat_jupyter
#SBATCH -t 04:00:00
#SBATCH --gpus=1
#SBATCH --output=./repeat_jupyter.log

sbatch ./jupyter.sh

sleep 3h 55m

sbatch ./repeat_jupyter.sh