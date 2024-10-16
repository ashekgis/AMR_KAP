#Creating Knowledge Attitude Practice Level columns (by numeric codes)
# load packages
library(tidyverse)
library(easystats)
library(gtsummary)
library(gt)

#read data
data <- readxl::read_xlsx("raw_data/AMR_KAP_Data.xlsx", sheet=2)

#knowledge level grouping
data <- data %>% 
  mutate(Knowledge_Level = case_when (
    KnowledgePCT < 50 ~ 0,
    KnowledgePCT >= 50 & KnowledgePCT < 80 ~ 1,
    KnowledgePCT >= 80 ~ 2
  ))

#attitude level grouping
data <- data %>% 
  mutate(Attitude_Level = case_when (
    AttitudePCT < 50 ~ 0,
    AttitudePCT >= 50 & AttitudePCT < 80 ~ 1,
    AttitudePCT >= 80 ~ 2
  ))

#practice level grouping
data <- data %>% 
  mutate(Practice_Level = case_when (
    PracticePCT < 80 ~ 0,
    PracticePCT >= 80 ~ 1
  ))


# save as rds (for large file)
write_rds(data, "data/AMR_KAP_Processed_1.rds")

#import data
data <- readRDS("data/AMR_KAP_Processed_1.rds")