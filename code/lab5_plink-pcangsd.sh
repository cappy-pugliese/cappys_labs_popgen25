#!/bin/bash
#SBATCH --job-name=pcangsd
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 6
#SBATCH --mem=5G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=caprina.pugliese@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

########### script start

hostname
date


## load modules
module load pcangsd/1.0
source /home/FCAM/cpugliese/.bashrc
conda activate pcangsd

## set variables
INDIR=/home/FCAM/cpugliese/popgen/data/02_lab5/01_plink
OUTDIR=/home/FCAM/cpugliese/popgen/data/02_lab5/02_pcangsd
PCANGSD="python3 /isg/shared/apps/pcangsd/1.0/pcangsd/pcangsd.py"

cd $OUTDIR

## PCAnsd
$PCANGSD -plink $INDIR/plink_muc19_data \
-admix \
-out $OUTDIR/pcangsd_muc19_data

conda deactivate
########### script end