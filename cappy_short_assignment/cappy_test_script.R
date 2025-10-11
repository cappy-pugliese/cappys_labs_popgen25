#setwd("/Users/caprinapugliese/Documents/School/Uconn/2024-26_Grad_School/2025-26_Year-2/popgen/labs/cappys_labs_popgen25/cappy_short_assignment")
source("cappy_short_assign_src.R")

# load in libraries
library(dplyr)

og_GT <- read.csv("25_10-09_short_assign_fake_data_w_NAs.csv")
samples <- read.csv("25_10-09_short_assign_pop-file.csv")

#GT_no_NAs <- read.table("25_10-09_short_assign_fake-data.txt")
# ^^for debugging in case there's an NA issue

## working so far, just need to make it work with all the data
freq_GT(og_GT$X1)

sample_het(og_GT$X1)


## still need to get to work
# reworking the data to get function to work
tGT <- as.data.frame(t(og_GT))
GT <- tGT |> dplyr::slice(2:41) |> setNames(og_GT$indivs)
GT <- as.data.frame(apply(GT, 2, function(x) as.numeric(as.character(x))))

fst_site()

cor_mat(GT_no_NAs$V2)
# code goes through, but just gets a bunch of weird lists with NAs