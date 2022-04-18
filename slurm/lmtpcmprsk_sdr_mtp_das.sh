#!/bin/bash
#SBATCH --job-name=deathAsOutcome
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=8G
#SBATCH --partition=panda
#SBATCH --array=1-8
## Command(s) to run:
echo "$SLURM_ARRAY_TASK_ID"

source ~/.bashrc

spack load /wvljhbh
cd ~/aki_comprisks-master/

R CMD BATCH --no-save --no-restore \
  '--args int_type=mtp est_type=sdr' \
  R/run_lmtp.R logs/run_lmtp_sdr_mtp.Rout
