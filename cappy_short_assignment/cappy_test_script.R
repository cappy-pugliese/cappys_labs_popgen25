#setwd("/Users/caprinapugliese/Documents/School/Uconn/2024-26_Grad_School/2025-26_Year-2/popgen/labs/cappys_labs_popgen25/cappy_short_assignment")
source("cappy_short_assign_src.R")

GT <- read.table("25_10-09_short_assign_fake_data_w_NAs.txt")
pops <- read.table("25_10-09_short_assign_pop-file.txt")

freq_GT(GT)