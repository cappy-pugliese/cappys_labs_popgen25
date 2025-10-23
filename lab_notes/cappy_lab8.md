## get the vcf file

`wget https://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20130502/ALL.chr22.phase3_shapeit2_mvncall_integrated_v5b.20130502.genotypes.vcf.gz`

`bcftools index chr22.vcf.gz`

-   I renamed it to chr22.vcf.gz

## Get subsampled vcf and prepare to run Dsuite

```{bash}
# print out the sample names we want to keep
awk 'NR > 1{print $1}' samples_for_introgression.txt > samples_to_keep.txt

# subset the samples we want to keep
bcftools view chr22.vcf.gz -S samples_to_keep.txt -Oz -o subsampled_chr22.vcf.gz
# and then index this new subsampled vcf
bcftools index subsampled_chr22.vcf.gz

# create a table for dsuite to run with sample names and populations, chang "YRI" to "Outgroup"
awk 'NR > 1{print $1 "\t" $4}' samples_for_introgression.txt > dsuite_samples_table.tsv
sed -i 's/YRI/Outgroup/' dsuite_samples_table.tsv
```

## Running Dsuite

```{bash}
# command for running Dsuite:
/core/projects/EBP/Wegrzyn/software/Dsuite/Build/Dsuite Dtrios

# set Dsuite variable:
Dsuite=/core/projects/EBP/Wegrzyn/software/Dsuite/Build/Dsuite
# run Dsuite with:
$Dsuite Dtrios
```

ERROR: Please fix the format of the dsuite_samples_table.tsv file. Line 523 does not have two columns separated by a tab.