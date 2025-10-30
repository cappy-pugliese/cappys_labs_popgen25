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

\^ made a script for running Dsuite

Dmin.txt output:

```{bash}
# ASW = American Southwest, ACB = AfroCarribean, CLM = Columbian, MXL = Mexican, FIN = Finnish
P1      P2      P3      Dstatistic      Z-score p-value f4-ratio        BBAA    ABBA    BABA
ASW     FIN     ACB     0.0493691       12.964  2.3e-16 0       6786.02 6035.7  5467.78
    ## ^^highest Dstatistic, with American Southwest being closest to Finland. Doesn't make sense from a close geographical standpoint. Kinda makes sense when you factor European migration into America.
ASW     CLM     ACB     0.0420463       11.3385 2.3e-16 0       6739.2  6024.7  5538.51
ASW     MXL     ACB     0.0439387       10.8694 2.3e-16 0       6770.54 6015.33 5508.96
    ## ^^makes sense, American Southwest is close to Mexican and Columbian. But not as high as it is to Finland.
CLM     FIN     ACB     0.00873178      4.9863  6.15477e-07     0       8916.01 4720.65 4638.92
CLM     MXL     ACB     0.00216905      1.92536 0.0541847       0       9063.4  4659.94 4639.76
MXL     FIN     ACB     0.0066501       3.09283 0.00198259      0       9021.89 4658.84 4597.29
CLM     FIN     ASW     0.0121035       4.46586 7.97485e-06     0       8359.78 4914.73 4797.19
CLM     MXL     ASW     0.00631079      3.34274 0.000829558     0       8503.02 4854.78 4793.89
    ## ^^^Here its showing that Columbian is more closely related to Finland than it is to Mexican. This doesn't make sense geographically.
MXL     FIN     ASW     0.00589021      1.73741 0.0823142       0       8450.49 4837.76 4781.1
CLM     FIN     MXL     0.00183236      0.176767        0.859692        0.0267735       5613.05       5780.73 5759.59
```