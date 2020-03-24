require(jsonlite)
df <- "this1.json"
json_file <- fromJSON(df)
json_file 
x <- json_file
temp <-data.frame();
temp2 <- data.frame();
for(i in 1:2){
   
   temp[i,1] <- x$metadata$title[[1]]
   temp[i,2] <- x$metadata$authors$first[[1]]
   #temp[i,3] <- x$metadata$authors$first[1] # there are 8 author first names 
   # temp[i,4] <- x$metadata$authors$first[2]
  # temp[i,5] <- x$metadata$authors$first[3] # need to figure out how to include them 
   #temp[i,6] <- x$metadata$authors$first[4]
   #temp[i,7] <- x$metadata$authors$first[5]
   #temp[i,8] <- x$metadata$authors$first[6]
   temp[i,3] <- x$metadata$authors$middle[[1]]
   temp[i,4] <- x$metadata$authors$last[[1]]
   temp[i,5] <- x$metadata$authors$suffix[[1]]
   #temp[i,33] <- x$metadata$authors$affiliation$laboratory[[1]]
   temp[i,6] <- x$metadata$authors$affiliation$institution[[1]]
   temp[i,7] <- x$metadata$authors$affiliation$location$postCode[[1]]
   temp[i,8] <- x$metadata$authors$affiliation$location$settlement[[1]]
   temp[i,9] <- x$metadata$authors$affiliation$location$region[[1]]
   temp[i,10] <- x$metadata$authors$affiliation$location$country[[1]]
   temp[i,11] <- x$metadata$authors$email[[1]]
   temp[i,12] <- x$abstract$text[[1]]
   temp[i,13] <- x$abstract$cite_spans[[1]] # NO DATA 
   temp[i,14] <-  x$abstract$ref_spans[[1]]# no data
   temp[i,15] <- x$abstract$section[[1]] #NOT IMPORTANT no data I DONT THINK 
   temp[i,16] <- x$body_text$text[[1]]
   temp[i,17] <- x$body_text$cite_spans[[1]]
   temp[i,18] <- x$body_text$ref_spans[[1]] # no information not important
   temp[i,19] <- x$body_text$section[[1]]
   temp[i,20] <- x$bib_entries$BIBREF0$ref_id[[1]] #  Error occurs herethere are multiple BIBREFS!
   temp[i,21] <- x$bib_entries$BIBREF0$title[[1]]
   temp[i,22] <- x$bib_entries$BIBREF0$authors[[1]] # THERE ARE MULTIPLE AUTHORS!
   temp[i,23] <- x$bib_entries$BIBREF0$year[[1]]
   temp[i,24] <- x$bib_entries$BIBREF0$venue[[1]]
   temp[i,25] <- x$bib_entries$BIBREF0$volume[[1]]
   temp[i,26] <- x$bib_entries$BIBREF0$issn[[1]]
   temp[i,27] <- x$bib_entries$BIBREF0$pages[[1]]
   temp[i,28] <- x$bib_entries$BIBREF0$other_ids[[1]] # NOthing here ! not useful 
   temp[i,29] <- x$ref_entries$FIGREF0$text[[1]] # THERE ARE MULTIPLE FIGREF0-5
   temp[i,30] <- x$ref_entries$FIGREF0$latex[[1]] # NOTHING THERE NOT USEFUL 
   temp[i,31] <- x$ref_entries$FIGREF0$type[[1]]
   temp[i,32] <- x$back_matter[[1]] # EMPTY LIST NOTHING THERE
   temp[i,33] <- x$metadata$authors$affiliation$laboratory[[1]]
   
   temp2 <- rbind(temp2,temp)
}
temp2
# NOTE TO SELF HOW TO I CONCATENATE INSIDE THE LOOP SO I CAN GET ALL AUTHORS NAMES AND SUCH IN ONE COLUMN
write.csv(temp2,file="temp2.csv")

#######################################################################
# TAKE ONLY THE ELEMENTS OF THE LIST THAT ARE VALID
# THE ONES BELOW ARE VALID

x <- json_file
temp1 <-data.frame();
temp3 <- data.frame();
for(i in 1:2){
  
  temp1[i,"Title"] <- x$metadata$title[[1]]
  temp1[i,"First Name"] <- x$metadata$authors$first[[1]]  # there are 8 author first names 
  temp1[i,"Middle Name"] <- x$metadata$authors$middle[[1]]
  temp1[i,"Last Name"] <- x$metadata$authors$last[[1]]
  temp1[i,"Suffix"] <- x$metadata$authors$suffix[[1]] # no suffix so no value/column
  temp1[i,"Labratory"] <- x$metadata$authors$affiliation$laboratory[[1]] # no affiliation no value 
  temp1[i,"Institution"] <- x$metadata$authors$affiliation$institution[[1]] # NO 4th column added!!!!!!!!
  temp1[i,"PostCode"] <- x$metadata$authors$affiliation$location$postCode[[1]]
  temp1[i,"Settlement"] <- x$metadata$authors$affiliation$location$settlement[[1]]
  temp1[i,"Region"] <- x$metadata$authors$affiliation$location$region[[1]]  
  temp1[i,"Country"] <- x$metadata$authors$affiliation$location$country[[1]]
  temp1[i,"Email"] <- x$metadata$authors$email[[1]]
  temp1[i,"Abstract Text"] <- x$abstract$text[[1]]
  temp1[i,"Section"] <- x$abstract$section[[1]]
  temp1[i,"Bpdy Text"] <- x$body_text$text[[1]]
  temp1[i,"Citation Spans"] <- x$body_text$cite_spans[[1]]
  temp1[i,"Section"] <- x$body_text$section[[1]]
  temp1[i,"Bibliography Ref ID"] <- x$bib_entries$BIBREF0$ref_id[[1]]
  temp1[i,"Bibliography Title"] <- x$bib_entries$BIBREF0$title[[1]]
  temp1[i,"Bibliography Authors"] <- x$bib_entries$BIBREF0$authors[[1]] # multiple authors 
  temp1[i,"Bibliography Year"] <-x$bib_entries$BIBREF0$year[[1]]
  temp1[i,"Bibliography Venue"] <- x$bib_entries$BIBREF0$venue[[1]]
  temp1[i,"Bibliography Volume"] <- x$bib_entries$BIBREF0$volume[[1]]
  temp1[i,"Bibliography Issn"] <- x$bib_entries$BIBREF0$issn[[1]]
  temp1[i,"Bibliography Pages "] <- x$bib_entries$BIBREF0$pages[[1]]
  temp1[i,"Fig Ref Text"] <- x$ref_entries$FIGREF0$text[[1]] # multiple text 
  temp1[i,"Fig Ref Type"] <- x$ref_entries$FIGREF0$type[[1]]
  temp1[i,"Affiliaton Labratory"] <- x$metadata$authors$affiliation$laboratory[[1]]
  
  temp3 <- rbind(temp3,temp1)
}
temp3

write.csv(temp3,file="temp3.csv")
