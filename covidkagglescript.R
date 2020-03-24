# GET COVID-19 ONLINE INTEREST
df_trendf <- read.csv("COVID19.csv")
countries1 <- read.csv("countries1.csv")
df_trend_f <- merge(df_trendf,countries1, by=c("geo"), all.x=TRUE)
df_trend_f <- df_trend_f[-c(2,6,7,8)]
colnames(df_trend_f)[5] <- "country_name"

# COVID COUNT FROM KAGGLE OFFIIAL 
df_count <- read.csv("covid_19_data.csv")

library(dplyr)

df_count_f <- df_count %>%
  group_by(ObservationDate,Country.Region)%>%
  summarize(confirmed = sum(Confirmed),deaths = sum(Deaths),recovered = sum(Recovered))

colnames(df_count_f)[2] <- "country_name"

# find unique countries and match them 
trendcountries <- unique(df_trend_f$country_name)
countcountries <- unique(df_count_f$country_name)

# convert from excel move on 
write.csv(trendcountries,file="trendcountries.csv")
write.csv(countcountries,file="countcountries.csv")

# just change values for two most important countries now 
df_trend_f$country_name <- gsub('United States of America', 'US', df_trend_f$country_name)
df_count_f$country_name <- gsub('Mainland China','China',df_count_f$country_name)

# picking the countries from count that are in trend!
# Get a dataframe of count that has only countries with google trend
df_final <- df_count_f[df_count_f$country_name %in% df_trend_f$country_name,]

# Reformating date for mergeing!
df_final$ObservationDate <- as.POSIXct(df_final$ObservationDate, format = '%m/%d/%Y')
df_trend_f$date <- as.POSIXct(df_trend_f$date, format = '%Y-%m-%d')

# rename column for merge
colnames(df_final)[1] <-"date"

# Merging by date and country name 
df_merge_final <- merge(df_final,df_trend_f,by=c("country_name","date"),all.x=TRUE)

final_f <- df_merge_final
df_merge_final <- final_f
# IF WANT LONGITUDE AND LATTIUDE THEN COVIDCOUNT HAS IT

# FIX HITS COLUMN LESS THAN 1 IS 0
final_f$hits <- gsub("<1",0,df_merge_final$hits) # make na values
final_f$hits[is.na(final_f$hits)] = 0;
df_merge_final <- final_f

write.csv(df_merge_final,file="FINAL_COVID-19.csv")
