## set variables
INDIR=/Users/caprinapugliese/Documents/School/Uconn/2024-26_Grad_School/2025-26_Year-2/popgen/labs/cappys_labs_popgen25/data/03_lab5/01_plink
OUTDIR=/Users/caprinapugliese/Documents/School/Uconn/2024-26_Grad_School/2025-26_Year-2/popgen/labs/cappys_labs_popgen25/data/03_lab5/02_pcangsd
PCANGSD="python3 /Users/caprinapugliese/.my-bin/pcangsd/pcangsd.py"

$PCANGSD -p $INDIR/plink_muc19_data -o $OUTDIR/pcangsd_muc19_data --admix