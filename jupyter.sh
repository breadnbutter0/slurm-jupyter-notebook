#!/bin/bash
#SBATCH --job-name=jupyter
#SBATCH --gpus-per-node=1
#SBATCH -t 04:00:00
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --mem=50G
#SBATCH --constraint=B  # specifying gilbreth node B uses NVIDIA A30
#SBATCH --output=./jupyter.log

echo ""
echo "==========================================================================="
echo "To access via your local machine"
echo ""
echo "1. Please search the ip address for the hostname: " 
echo ""
/bin/hostname 
echo ""
" from the bottom section of the jupyter.log"
echo "  ex) <172.18.36.16> for host <gilbreth-b002> "
echo ""
echo "2. In you local terminal, run command: 
            ssh -N -L8081:<host_id_address>:8081 "$USER"@gilbreth.rcac.purdue.edu"
echo ""
echo "3. Open a browser from your local machine and paster the jupyter server URL from jupyter.log"
echo "  ex) http://127.0.0.1:8081/?token=487669909474..."
echo ""
echo ""
echo ""
echo "To access via Visual Studio Code:"
echo ""
echo "1. Copy jupyter notebook serever from jupyter.log"
echo "  ex) http://gilbreth-b003.rcac.purdue.edu:8001/?token=487669..."
echo ""
echo "2. Ctrl + Shift + P, search 'Jupyter: Specify jupyter server for connections'"
echo ""
echo "3. Choose existing server and paste the URL from Step 1."
echo ""
echo "==========================================================================="
echo ""

echo "==========================================================================="
echo ""
echo "Host ip address lists:"
echo ""
echo ""
cat /etc/hosts
echo ""
echo "==========================================================================="


module load anaconda

jupyter notebook --no-browser --ip=$(hostname -s) --port=8081 --notebook-dir=~/


