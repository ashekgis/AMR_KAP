library(tidyverse)
library(gtsummary)
library(gt)

#import data
data <- readRDS("data/AMR_KAP_Processed.rds")

# Table 1. Demographic characteristics of study participants
data %>%
  select(1:11) %>% 
  tbl_summary()%>% 
  as_gt() %>% 
  gtsave("tables/Table1.docx")
  
# Table 2. Major sources of information about antibiotic parents
data %>% 
  select(47:55) %>% 
  tbl_summary() %>% 
  as_gt() %>% 
  gtsave("tables/Table2.docx")

#Table 3 Level of knowledge, attitudes, and practices towards antibiotic resistance 
data %>%
  select(69:71) %>% 
  tbl_summary() %>% 
  as_gt() %>% 
  gtsave("tables/Table3.docx")