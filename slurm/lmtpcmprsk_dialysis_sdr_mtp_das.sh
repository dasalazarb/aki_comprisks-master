#!/bin/bash
#SBATCH --job-name=deathAsOutcome
#SBATCH --partition=panda
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=40G
#SBATCH --array=1-20
## Command(s) to run:
echo "$SLURM_ARRAY_TASK_ID"

source ~/.bashrc

spack load /wvljhbh # R
cd ~/aki_comprisks-master/

R CMD BATCH --no-save --no-restore \
  '--args int_type=mtp est_type=sdr' \
  R/run_lmtp_deathAsCompRisk.R results/run_lmtp_mtp_sdr_das.Rout
