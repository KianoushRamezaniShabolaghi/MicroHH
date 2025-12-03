#!/bin/bash
# Parameter sweep job submission to SLURM

# Parameter ranges
Us=(2 4 6 8)
z0s=(0.01 0.1 1.0)

for U in "${Us[@]}"; do
  for z0 in "${z0s[@]}"; do
    
    casename="U${U}_z0${z0}"
    mkdir -p "$casename"

    # Create job file
    cat > "$casename/job.slurm" << EOF
#!/bin/bash
#SBATCH --job-name=${casename}
#SBATCH --output=${casename}.out
#SBATCH --error=${casename}.err
#SBATCH --time=02:00:00
#SBATCH --partition=standard
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G

module load microhh       # only if required by your system

cd \$SLURM_SUBMIT_DIR/$casename

# Copy and modify input file
sed -e "s/Uref = 5/Uref = $U/" \
    -e "s/z0 = 0.1/z0 = $z0/" \
    ../template.ini > ${casename}.ini

# Run simulation
microhh init ${casename}.ini
microhh run ${casename}.ini > log.txt
EOF

    # Submit job
    sbatch "$casename/job.slurm"

    echo "Submitted job for U=$U z0=$z0"
  done
done
