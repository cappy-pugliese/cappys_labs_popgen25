#setwd("/Users/caprinapugliese/Documents/School/Uconn/2024-26_Grad_School/2025-26_Year-2/popgen/labs/cappys_labs_popgen25/cappy_short_assignment")
source("cappy_short_assign_src.R")

GT <- read.table("25_10-09_short_assign_fake_data_w_NAs.txt")
samples <- read.table("25_10-09_short_assign_pop-file.txt")

#GT_no_NAs <- read.table("25_10-09_short_assign_fake-data.txt")
# ^^for debugging in case there's an NA issue

## working so far, just need to make it work with all the data
freq_GT(GT$V2)
#[1] 0.3
freq_GT(GT$V17)
#[1] 0.45

sample_het(GT$V2)
#[1] 0.4307692
sample_het(GT$V17)
#[1] 0.5076923

## still need to get to work
fst_site()

cor_mat(GT_no_NAs$V2)
# code goes through, but just gets a bunch of weird lists with NAs