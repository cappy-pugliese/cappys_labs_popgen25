#!/bin/bash
#SBATCH --job-name=Dsuite
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 2
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
# set variables
DSUITE=/home/FCAM/cpugliese/bin/Dsuite/Build/Dsuite
INDIR=/home/FCAM/cpugliese/popgen/03_lab08

cd $INDIR

$DSUITE Dtrios subsampled_chr22.vcf.gz dsuite_samples_table.tsv -o chr22_test

########### script end