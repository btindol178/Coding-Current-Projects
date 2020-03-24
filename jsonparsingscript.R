install.packages("jsonlite")
library(jsonlite)

df <- "this1.json"
json_file <- fromJSON(df)
json_file 
x <- json_file

# Acessing different parts of the lists
a1 <- x[[1]] # Header irrelevant
a1
a2 <- x[[2]]
a2
a3 <- x[[3]]
a3
a4 <- x[[4]]
a4
a5 <- x[[5]]$BIBREF0[[2]]
a5
a6 <- x[[6]]$FIGREF0[[1]]
a6
a7 <- x[[7]]
a7 

# Using Lapply
fm <-names(x)
lapply(fm, typeof) # showing type of each part of list 
str(lapply(fm, typeof)) # showing structure

# Trying to unlist un distiguisable format
unlist <- matrix(unlist(x$abstract))
unlist1 <- matrix(unlist(x$body_text))
unlist2 <- matrix(unlist(x$metadata))

# trying to split
mydfs <- split(x,fm)
ok <- as.data.frame(unlist(split(x,fm)))


# Loop version 1
for (i in x) {
  print(x)
}

# Loop version 2
for (i in 1:length(x)) {
  print(x[[i]])
  }
# nested dataframe 
# trying to loop through the different elements inside the of the list
# because it is a nested list 
df1=data.frame()
temper = data.frame();
for (i in seq_along(x)) {
  for (j in seq_along(x[[i]])) {
    temper[i,j] <- x[[i]][[j]]
    temps <- rbind(temper,temps)
    
      }
 }
temps

# Try data.table
library(data.table)
rbindlist(x, fill=TRUE)

library(dplyr)
bind_rows(x)

library(plyr)
rbind.fill(x)

library(tidyverse)
library(broom)

dfn <- x %>%
  unnest(x, .drop = T)
