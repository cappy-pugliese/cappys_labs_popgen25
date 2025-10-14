INDIR=/Users/caprinapugliese/Documents/School/Uconn/2024-26_Grad_School/2025-26_Year-2/popgen/labs/cappys_labs/data/01_muc19_data

cd $INDIR

~/.my-bin/plink_mac_20250819/plink --vcf muc19_subsample.vcf \
--double-id \
--allow-extra-chr \
--maf 0.01 \
--geno 0.1 \
--mind 0.5 \
--chr 12 \
--thin 0.1 \
-r2 gz \
--ld-window 100 \
--ld-window-kb 1000 \
--ld-window-r2 0 \
--out plinkoed_muc19_data