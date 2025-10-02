# Read in libraries
library(readr)
library(ggplot2)
library(vcfR)
library(scales)

# Read in vcf
setwd("/Users/caprinapugliese/Documents/School/Uconn/2024-26_Grad_School/2025-26_Year-2/popgen/labs/cappys_labs/data/01_muc19_data")

vcf = read.vcfR("muc19_subsample.vcf.gz")
GT = extract.gt(vcf,element="GT",as.numeric=TRUE)


# calculating freq_ij
freq_ij = function(site_i,site_j){
    n_ij = length(intersect(which(site_i==1),which(site_j==1)))
    n_sites =  length(which(!is.na(site_i)) | which (!is.na(site_j)))
    return(n_ij/n_sites)
}

freq_GT = function(site,ploidy=2){
  clean_site = na.omit(site)
  total_sites = ploidy*length(site)
  p = sum(clean_site)/total_sites
  return(p)
}

#updated d_ij with freq_ij
d_ij = function(site_i,site_j){
    p_i = freq_GT(site_i,1)
    p_j = freq_GT(site_j,1)
    p_ij = freq_ij(site_i,site_j)
    D_ij = p_ij - p_i*p_j
    return(D_ij)
}

#Function to run on each row
allele_2_num = function(site,name){
  div_allele = gsub(".*:.*:([A,T,C,G]+):","",name)
  GT_row = as.numeric(site==div_allele)
  return(GT_row)
}

#Structure for whole vcf
extract_haps = function(vcf){
  haps = extract.haps(vcf)
  names = rownames(haps)
  num_mat = t(sapply(1:dim(haps)[1],function(x) allele_2_num(haps[x,],names[x])))
  rownames(num_mat) = names
  colnames(num_mat) = colnames(haps)
  return(num_mat)
}

##############

#Function to LD-prune a VCF
ld_prune = function(vcf,window_size,cutoff=0.1){
  GT = extract_haps(vcf)
  freqs = apply(GT,1,function(x) freq_GT(x,ploidy=1))
  GT = GT[which(freqs*(1-freqs)>0),]
  chr_id = gsub(":.*:.*:.*","",rownames(GT))
  chrs = sort(unique(chr_id))
  sub_GT = lapply(chrs,function(x) ld_prune_chr(GT[chr_id==x,],window_size=window_size,cutoff=cutoff)) 
  return(sub_GT)
}

#Within each chromosome, generate windows and find only the sites to be dropped.
ld_prune_chr = function(GT,window_size,cutoff=0.1){
  pos = as.numeric(gsub(".*:([0-9]*):.*","\\1",rownames(GT)))
  breaks = unique(c(seq(from=min(pos)-1,to=max(pos),by=window_size),max(pos)))
  bins = cut(pos,breaks,right=TRUE)
  #Drop bins with 1 or fewer entries
  bad_bins = names(which(table(bins)<2))
  bins = factor(bins,exclude=bad_bins)
  drop = unlist(sapply(levels(bins),function(x) ld_prune_window(GT[which(bins==x),],cutoff=cutoff)))
  sub_GT = GT[setdiff(rownames(GT),drop),]
  return(sub_GT)
}

#Within each window, calculate correlations, keep only the first allele with high correlations
ld_prune_window = function(GT,cutoff=0.1){
  cor_mat = cor(t(GT))
  to_check = 1:dim(cor_mat)[1]
  drop = c()
  while(length(to_check)>0){
    high_cor = which(cor_mat[to_check[1],]>cutoff)
    drop = c(drop,setdiff(high_cor,to_check[1]))
    to_check = setdiff(to_check,high_cor)
  }
  if(length(drop)>0){
    return(rownames(GT)[drop])
  }
}
