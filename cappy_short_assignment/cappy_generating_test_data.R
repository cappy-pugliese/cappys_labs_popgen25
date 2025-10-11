#setwd("/Users/caprinapugliese/Documents/School/Uconn/2024-26_Grad_School/2025-26_Year-2/popgen/labs/cappys_labs_popgen25/cappy_short_assignment")

# load libraries
library(dplyr)

######## generating the data ########

### population file ###
#numbering the individuals
indivs <- sprintf("IND_%d", 1:20)

#Assigning the populations: first 5 are pop1, next 5 are pop2, etc.
population <- rep(c("POP1","POP2","POP3","POP4"), each=5)

#Put all variables data together
pop_test_file <- data.frame(indivs,population)

#creating the file
write.csv(pop_test_file,file="25_10-09_short_assign_pop-file.csv",row.names=FALSE,quote=FALSE)


### test data file ###
# number of allele sites
n_sites <- 40

# create the allele data
allele_data <- t(replicate(length(indivs), rbinom(n_sites, 1, 0.5)))
# 0.5 in rbinom is the probability of recieving a 1 vs a 0

# putting it all together
fake_data <- data.frame(row.names = indivs, allele_data)

rename_with(fake_data, .cols = everything(), ...)


#creating the file
write.csv(fake_data,file="25_10-09_short_assign_fake-data.csv",quote=FALSE)


### adding missing data ###
set.seed(456)

missing_per_ind <- 5

# adding in the NAs
for (ind in seq_len(nrow(allele_data))) {
  miss_cols <- sample(n_sites, missing_per_ind)
  allele_data[ind, miss_cols] <- NA
}

# putting it into one dataframe
missing_data <- data.frame(row.names = indivs, allele_data)

write.csv(missing_data,file="25_10-09_short_assign_fake_data_w_NAs.csv",quote=FALSE)
