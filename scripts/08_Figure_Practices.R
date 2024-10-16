#load packages
library(tidyverse)
library(likert)
library(ggpubr)
library(ggthemes)
library(RColorBrewer)

install.packages("RColorBrewer")

#import data
data <- readxl::read_excel("raw_data/AMR_KAP_Data.xlsx",sheet = 1)

#Likert items
lds <- data

#check str
glimpse(lds)

#Visualize Practice Response
Practice_df <- lds %>% 
  select(34:39) %>% 
  mutate_if(is.character,as.factor) %>%
  as.data.frame()

#plot in Likert scale
p1 <- plot(likert(Practice_df),
           ordered = FALSE,
           group.order =names(Practice_df))
p1 + theme_pubr()
p1

#export
ggsave("figures/Practice.tiff",units = "in", width = 12, 
       height = 6, dpi = 300, compression = 'lzw')