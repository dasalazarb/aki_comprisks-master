#!/bin/bash
#SBATCH --job-name=deathAsOutcome
#SBATCH --partition=panda
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=10G
#SBATCH --array=1-3
## Command(s) to run:
echo "$SLURM_ARRAY_TASK_ID"

source ~/.bashrc

spack load /wvljhbh # R
cd ~/aki_comprisks-master/

R CMD BATCH --no-save --no-restore \
  '--args int_type=mtp est_type=sdr' \
  R/run_lmtp.R results/run_lmtp_sdr_mtp_das.Rout
