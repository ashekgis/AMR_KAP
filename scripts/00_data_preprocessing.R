#load packages
library(tidyverse)
library(naniar)

#read data
data <- readxl::read_xlsx("raw_data/AMR_KAP_Data.xlsx", sheet=2)


#check missing data
sum(is.na(data))
miss_var_summary(data)
gg_miss_var(data)
help("naniar")

#knowledge level grouping
data1 <- data %>% 
  mutate(Knowledge_Level = case_when (
    KnowledgePCT < 50 ~ "Poor",
    KnowledgePCT >= 50 & KnowledgePCT < 80 ~ "Moderate",
    KnowledgePCT >= 80 ~ "Good"
  ))

#attitude level grouping
data <- data %>% 
  mutate(Attitude_Level = case_when (
    AttitudePCT < 50 ~ "Negative",
    AttitudePCT >= 50 & AttitudePCT < 80 ~ "Uncertain",
    AttitudePCT >= 80 ~ "Positive"
  ))

#practice level grouping
data <- data %>% 
  mutate(Practice_Level = case_when (
    PracticePCT < 80 ~ "inappropriate",
    PracticePCT >= 80 ~ "appropriate"
  ))

#export pre-processed data
#as csv
write.csv(data,"data/AMR_KAP_Processed.csv", row.names = F)

# save as rds (for large file)
write_rds(data, "data/AMR_KAP_Processed.rds")

