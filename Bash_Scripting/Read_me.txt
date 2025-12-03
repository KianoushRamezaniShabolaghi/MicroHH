for the Run_Parameters.sh file:
How to run it:
chmod +x submit_sweep.sh
./submit_sweep.sh

The script performs an automated parameter sweep for simulations by varying two parameters:

U takes values 2, 4, 6, 8

z0 takes values 0.01, 0.1, 1.0

For every combination of these values, a new directory is created, an input file is generated, and the model is run.




for U in 2 4 6 8; do
  for z0 in 0.01 0.1 1.0; do

These loops produce 12 total cases (4 values of U × 3 values of z0).



If microhh is in your system PATH

(e.g. installed via package manager or manually added to PATH)

Then this is correct:

microhh init "${casename}.ini"


No ./ is needed because the shell can already find the executable.

You can check with:

which microhh


If it prints something like /usr/local/bin/microhh, then you’re good.


If microhh is in the current directory

For example, if you compiled it locally and run it like:

./microhh ...


Then, the script should use ./microhh:

./microhh init "${casename}.ini"
./microhh run "${casename}.ini" > log.txt 2>&1 &


Otherwise you will get:

microhh: command not found





for the Multiple_Run_Paramters.sh:
for submitting multiple jobs to SLURM on a supercomputer.
It loops over parameter combinations, writes a job script dynamically, and submits it with sbatch


How to run it:
chmod +x submit_sweep.sh
./submit_sweep.sh


This will submit 12 independent SLURM jobs, each with a different U and z0.
