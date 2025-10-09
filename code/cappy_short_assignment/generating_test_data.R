# libraries
install.packages("charlatan")
library("charlatan")
# ^^can use for generating random NA values
library(dplyr)
#setwd("/Users/caprinapugliese/Documents/School/Uconn/2024-26_Grad_School/2025-26_Year-2/popgen/labs/cappys_labs_popgen25/data/test_data")

######## generating the data ########

### population file 
#numbering the individuals
indivs <- rep(1:20)
cat(my_string, "with R", sep=" =) ")
#Assigning the countries: first 50 patients to USA, the next 50 to UK and so on
pop <- rep(c("POP1","POP2","POP3","POP4"), each=5)

#Put all variables data together
pop_test_file <- data.frame(indivs,pop)

#creating the file
write.table(pop_test_file,file="25_10-09_short_assign_pop-file.txt",row.names=FALSE,quote=FALSE)


### test data file


#Assign the gender for each patient using rbinom() function 0 for Female and 1 for male or vice versa
# 400 rows/patients, one trial with probability of 0.5 for 1
indivs <- rep("A":"Z")

for (ind in indivs) {
  print(rbinom(20, 1, 0.5))
}




