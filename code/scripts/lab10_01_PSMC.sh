#!/bin/bash
#SBATCH --job-name=PSMC
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 2
#SBATCH --mem=2G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

########### script start

hostname
date

## load modules
module load psmc/0.6.5
module load bcftools/1.20
module load seqtk/1.3
module load samtools/1.20

## variables
sample="NA19770"
psmcdir=/home/FCAM/cpugliese/bin/psmc
INDIR=/home/FCAM/cpugliese/popgen/data
OUTDIR=/home/FCAM/cpugliese/popgen/04_lab10
VCF=subsampled_chr22.vcf.gz
REF=chr22.fa

cd $OUTDIR

## run programs
### will make psmc requisite file
#bcftools view -s $sample ${INDIR}/${VCF} -Oz -o ${sample}.vcf.gz

#seqtk mutfa ${INDIR}/${REF} <(gzip -dc ${sample}.vcf.gz|${psmcdir}/utils/vcf2snp.pl -) | seqtk seq | ${psmcdir}/utils/fq2psmcfa - > ${sample}.psmcfa

# filter psmc req file
samtools mpileup -C50 -uf ${REF}.fa ${sample}.bam | bcftools view -c - \
      | vcfutils.pl vcf2fq -d <lower_quartile_depth> -D <upper_quartile_depth> | gzip > ${sample}.fq.gz

${psmcdir}/utils/fq2psmcfa -q20 ${sample}.fq.gz > ${sample}.psmcfa

# finally run psmc
${psmc}/psmc -N25 -t15 -r5 -p "4+25*2+4+6" -o ${sample}.psmc ${sample}.psmcfa
########### script end