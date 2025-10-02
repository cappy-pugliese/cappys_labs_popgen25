freq_GT = function(site){
  clean_row = na.omit(row)
  num_derived = sum(site)
  total_sites = 2*length(site)
  return(num_derived/total_sites)
}

sample_het = function(site){
  n = 2*length(site)
  p = freq_GT(site)
  h = n/(n-1)*2*p*(1-p)
  return(h)
  }


n_obs = function(row) {
  return(length(row)*2)
  }

dxy_site = function(p1,p2){
  dxy = p1*(1-p2)+p2*(1-p1)
  return(dxy)
}
