#!/bin/bash
#SBATCH --job-name=Amber
#SBATCH --output=charm_gui_%j.out
#SBATCH --error=charm_gui_%j.err
#SBATCH --qos=acc_bscls
##SBATCH --qos=acc_debug
##SBATCH --time=1:00:00
#SBATCH --cpus-per-task=20
#SBATCH --nodes=1
#SBATCH --gres=gpu:1
#SBATCH --account=bsc72
#SBATCH --ntasks=1

# Runner with Amber with files from Charm-GUI

module purge
module load impi intel mkl
module load amber/24

amber="/apps/ACC/AMBER/24/GCC/OPENMPI/bin/pmemd.cuda"

init="step5_input"
mini_prefix="step6.0_minimization"
equi_prefix="step6.%d_equilibration"
prod_prefix="step7_production"
prod_step="step7"

# Minimization
# In the case that there is a problem during minimization using pmemd.cuda, please try to use pmemd only for
# the minimization step.
if [ -e "dihe.restraint" ]; then
    sed -e "s/FC/250.0/g" "dihe.restraint" > "${mini_prefix}.rest"
fi
$amber -O -i "${mini_prefix}.mdin" -p "${init}.parm7" -c "${init}.rst7" -o "${mini_prefix}.mdout" -r "${mini_prefix}.rst7" -inf "${mini_prefix}.mdinfo" -ref "${init}.rst7"

# Equilibration
cnt=1
cntmax=6
fc=('250.0' '100.0' '50.0' '50.0' '25.0')

while [ $cnt -le $cntmax ]; do
    pcnt=$((cnt-1))
    istep=$(printf "${equi_prefix}" $cnt)
    pstep=$(printf "${equi_prefix}" $pcnt)
    if [ $cnt -eq 1 ]; then
        pstep="$mini_prefix"
    fi

    if [ -e "dihe.restraint" ] && [ $cnt -lt $cntmax ]; then
        sed -e "s/FC/${fc[cnt]}/g" "dihe.restraint" > "${istep}.rest"
    fi
    $amber -O -i "${istep}.mdin" -p "${init}.parm7" -c "${pstep}.rst7" -o "${istep}.mdout" -r "${istep}.rst7" -inf "${istep}.mdinfo" -ref "${init}.rst7" -x "${istep}.nc"
    cnt=$((cnt+1))
done

# Production
cnt=1
cntmax=50 # Number of production 10ns (10ns * 50 = 500ns) 

while [ $cnt -le $cntmax ]; do
    pcnt=$((cnt-1))
    istep="${prod_step}_${cnt}"
    pstep="${prod_step}_${pcnt}"
    if [ $cnt -eq 1 ]; then
        pstep=$(printf "${equi_prefix}" 6)
    fi

    $amber -O -i "${prod_prefix}.mdin" -p "${init}.parm7" -c "${pstep}.rst7" -o "${istep}.mdout" -r "${istep}.rst7" -inf "${istep}.mdinfo" -x "${istep}.nc"
    cnt=$((cnt+1))
done

