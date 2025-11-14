library(tess3r)
library(readr)
library(maps)
library(raster)
library(terra)
library(rworldmap)


setwd("/Users/caprinapugliese/Documents/School/Uconn/2024-26_Grad_School/2025-26_Year-2/popgen/labs/cappys_labs_popgen25/plots")

samples_table = read_csv("/Users/caprinapugliese/Documents/School/Uconn/2024-26_Grad_School/2025-26_Year-2/popgen/labs/PopGen25/labs/data/nacanids.csv")
geno = as.matrix(read.table("/Users/caprinapugliese/Documents/School/Uconn/2024-26_Grad_School/2025-26_Year-2/popgen/labs/PopGen25/labs/data/nacanids.lfmm"))

#Quick visualization
plot(samples_table$Long,samples_table$Lat,pch=16)
map(add=T,interior=F)


coords = as.matrix(samples_table[,2:3])
tess3_res = tess3(X=geno,coord=coords,K=1:8,method="projected.ls",ploidy=2,openMP.core.num=4)


your_K = 5
ancestry_matrix =  qmatrix(tess3_res,K=your_K)
ancestry_barplot = barplot(ancestry_matrix,border=NA,space=0,xlab="Ind",ylab="Ancestry")


area_plot = plot(ancestry_matrix,coords,method="map.max",interpol=FieldsKrigModel(10))