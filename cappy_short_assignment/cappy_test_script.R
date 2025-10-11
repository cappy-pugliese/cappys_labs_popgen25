#setwd("/Users/caprinapugliese/Documents/School/Uconn/2024-26_Grad_School/2025-26_Year-2/popgen/labs/cappys_labs_popgen25/cappy_short_assignment")
source("cappy_short_assign_src.R")

# load in libraries
library(dplyr)

GT <- read.csv("25_10-09_short_assign_fake_data_w_NAs.csv")
samples <- read.csv("25_10-09_short_assign_pop-file.csv")

# fix samples table
tGT <- as.data.frame(t(GT))
tGT |> dplyr::slice(1)

#GT_no_NAs <- read.table("25_10-09_short_assign_fake-data.txt")
# ^^for debugging in case there's an NA issue

## working so far, just need to make it work with all the data


freq_GT(GT$X2)
#[1] 0.5
freq_GT(GT$X17)
#[1] 0.4

sample_het(GT$X2)
#[1] 0.5128205
sample_het(GT$X17)
#[1] 0.4923077

## still need to get to work
fst_site()

cor_mat(GT_no_NAs$V2)
# code goes through, but just gets a bunch of weird lists with NAs