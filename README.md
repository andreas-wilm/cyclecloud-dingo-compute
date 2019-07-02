# CycleCloud Project for an MPI/SLURM computer using Lustre as storage backend

- The template file was created with [Hugo Meiland's template generator](https://github.com/hmeiland/cyclecloud-demotemplates/tree/master/generator).
- This cluster's master has two NFS shares /mnt/exports/shared (mounted as /shared) and /mnt/exports/sched (mounted as sched) 
- The cluster's admin's home is /shared/home/$admin
- The Lustre backend has to already exist on CycleCloud. For the appropriate Lustre project see [Hugo's Lustre CycleCloud project on Github](https://github.com/hmeiland/cyclecloud-lustre)

