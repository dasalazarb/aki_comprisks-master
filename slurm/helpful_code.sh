spack find -v -l r

spack load /wvljhbh

## srun -n1 --pty --partition=panda --mem=10G bash -i

rm -rf aki_comprisks-master/
git init
git clone https://github.com/dasalazarb/aki_comprisks-master.git

sbatch --exclude=node150,node158,node160,node108,node109 aki_comprisks-master/slurm/lmtpcmprsk_sdr_static_das.sh
squeue -u das4019
sacct -u das4019

ls aki_comprisks-master/data/results

rm -rf aki_comprisks-master/
git init
git clone https://github.com/dasalazarb/aki_comprisks-master.git

sbatch --exclude=node150,node158,node160,node108,node109 aki_comprisks-master/slurm/lmtpcmprsk_dialysis_sdr_mtp_das.sh
squeue -u das4019
sacct -u das4019

ls aki_comprisks-master/data/results

# ## cd aki_comprisks-master/slurm/
# sbatch aki_comprisks-master/slurm/lmtpcmprsk_sdr_mtp_das.sh
# sbatch --exclude=node150,node158,node160,node108,node109 aki_comprisks-master/slurm/lmtpcmprsk_sdr_mtp_das.sh
# squeue -u das4019
# sacct -u das4019

## to check out R
cd aki_comprisks-master/results/
vim run_lmtp_sdr_mtp_das.Rout

## check the process submitted
squeue -u das4019

## cancel job
scancle JOBID

## this is a error:
## slurmstepd: error: task/cgroup: unable to add task[pid=6756] to memory cg '(null)'

# remove .out files 
cd aki_comprisks-master/logs/
rm -rf run_lmtp_sdr_mtp_das.Rout
cd
cd aki_comprisks-master/slurm/
find . -name "*.out" -exec rm {} +
cd