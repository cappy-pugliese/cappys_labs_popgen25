#read in libraries
install.packages("readr")
library(readr)
library(ggplot2)
library(vcfR)

#read in data (need the readr library to read in tsv)
buf_data <- read_tsv("PopGen25/labs/data/buffalo_2021.txt")
buf_data$pred_log10_N

#make plot
buf1_plot <- ggplot(data=buf_data, aes(pred_log10_N, log10_diversity)) +
  geom_point()
buf1_plot

# Moving onto VCFs
require(vcfR)
vcf = read.vcfR("PopGen25/labs/data/test_data.vcf")
GT = extract.gt(vcf,element="GT",as.numeric=TRUE)

# h = n/(n-1) *2p(1-p)
# n = 2*length(site)
# p = sum(site)/n

# site = omit_na
# or site = site[!is.na(site)]

# return ((n/(n-1))*2p(1-p))

# popgenome r package


### Unfortunatly didn't get a lot done this lab because I was testing out positron and getting used to that, and then I also forgot how to code in R.