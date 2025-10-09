#1. Take a genotype matrix and a sample table as input.
#2. Return individual site frequency across the genotype matrix for each population.

freq_GT = function(site,ploidy=1){
  clean_site = na.omit(site)
  total_sites = ploidy*length(site)
  p = sum(clean_site)/total_sites
  return(p)
}

#3. Return site sample heterozygosity for each population.
sample_het = function(site){
  n = 2*length(site)
  p = freq_GT(site)
  h = n/(n-1)*2*p*(1-p)
  return(h)
}

#4. Calculate all pairwise undefinedF_ST values for all pairs of samples.
fst_site = function(p1,p2,n1,n2){
    f1 = n1/(n1+n2)
    f2 = 1-f1
    num = f1*p1*(1-p1)+f2*p2*(1-p2)
    denom = (f1*p1+f2*p2)*(f1*(1-p1)+f2*(1-p2)) 
    fst = 1-num/denom
    return(fst)
}

#5. Return average r^2 correlation within each population.
cor_mat = function(GT){
    cor(t(GT))
}
