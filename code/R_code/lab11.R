library(tess3r)
library(readr)
library(maps)

setwd("/Users/caprinapugliese/Documents/School/Uconn/2024-26_Grad_School/2025-26_Year-2/popgen/labs/cappys_labs_popgen25/plots")

samples_table = read_csv("/Users/caprinapugliese/Documents/School/Uconn/2024-26_Grad_School/2025-26_Year-2/popgen/labs/PopGen25/labs/data/nacanids.csv")
#Quick visualization
plot(samples_table$Long,samples_table$Lat,pch=16)
map(add=T,interior=F)
geno = as.matrix(read.table("/Users/caprinapugliese/Documents/School/Uconn/2024-26_Grad_School/2025-26_Year-2/popgen/labs/PopGen25/labs/data/nacanids.lfmm"))