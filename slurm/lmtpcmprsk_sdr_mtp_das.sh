#!/bin/bash
#SBATCH --job-name=deathAsOutcome
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=10G
#SBATCH --partition=panda
#SBATCH --array=1-8
## Command(s) to run:
echo "$SLURM_ARRAY_TASK_ID"

source ~/.bashrc

spack load /wvljhbh
## module load openblas/0.2.20 gcc/6.3.0 r/4.0.3 r-packages/default
## k7ewedg openblas@0.3.8~ilp64+pic+shared threads=none
spack load /k7ewedg
## t5bjiq6 gcc@8.2.0~binutils~nvptx~piclibs~strip languages=c,c++,fortran
spack load /t5bjiq6
## module load openblas/0.2.20 gcc/6.3.0 r/4.1.1 r-packages/default
cd ~/aki_comprisks-master/

R CMD BATCH --no-save --no-restore \
  '--args int_type=mtp est_type=sdr' \
  R/run_lmtp.R logs/run_lmtp_sdr_mtp_das.Rout
