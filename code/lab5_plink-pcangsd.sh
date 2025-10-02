#!/bin/bash
#SBATCH --job-name=pcangsd
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --mem=20G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=caprina.pugliese@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

########### script start

hostname
date

cd /home/FCAM/cpugliese
## creating environment
module load anaconda3/4.1.1
conda create -n pcangsd
source activate pcangsd
conda install pip
pip install pcangsd

## load modules
module load pcangsd/1.0
module load python/3.10.1

## set variables
INDIR=/home/FCAM/cpugliese/popgen/data/02_lab5/01_plink
OUTDIR=/home/FCAM/cpugliese/popgen/data/02_lab5/02_pcangsd
PCANGSD="python3 /isg/shared/apps/pcangsd/1.0/pcangsd/pcangsd.py"

cd $OUTDIR
## PCAnsd
$PCANGSD -plink $INDIR/plink_muc19_data \
-threads 8 \
-out $OUTDIR/pcangsd_muc19_data

$PCANGSD -p $INDIR/plink_muc19_data -o $OUTDIR/pcangsd_muc19_data --admix


########### script end
