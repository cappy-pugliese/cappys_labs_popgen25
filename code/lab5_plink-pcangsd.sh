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

#cd /home/FCAM/cpugliese
## creating environment
    #module load anaconda3/4.1.1
    #conda create -n pcangsd
    #source activate pcangsd
    #conda install pip
    #pip install pcangsd

## load modules
module load pcangsd/1.0
module load python/3.10.1
module load anaconda3/4.1.1

source activate pcangsd

## set variables
INDIR=/home/FCAM/cpugliese/popgen/data/02_lab5/01_plink
OUTDIR=/home/FCAM/cpugliese/popgen/data/02_lab5/02_pcangsd
PCANGSD=/home/FCAM/cpugliese/software/pcangsd/pcangsd.py

cd $OUTDIR
## PCAnsd
python3 $PCANGSD -plink $INDIR/plink_muc19_data \
-threads 8 \
-out $OUTDIR/pcangsd_muc19_data \
-admix


########### script end


##requirements
- numpy
- scipy
- cython

- argparse
- re???
- sre_compile
- _sre.MAGIC

##errors
File "/home/FCAM/cpugliese/software/pcangsd/pcangsd.py", line 9, in <module>
    import argparse
  File "/isg/shared/apps/anaconda3/4.1.1/lib/python3.5/argparse.py", line 89, in <module>
    import re as _re
  File "/isg/shared/apps/anaconda3/4.1.1/lib/python3.5/re.py", line 123, in <module>
    import sre_compile
  File "/isg/shared/apps/anaconda3/4.1.1/lib/python3.5/sre_compile.py", line 17, in <module>
    assert _sre.MAGIC == MAGIC, "SRE module mismatch"
AssertionError: SRE module mismatch