library(tidyverse)

## create a data frame from data/installed-packages.csv
## with, e.g., readr::read_csv() or read.csv()
my_ipt <- read_csv(here("data","installed-packages.csv"))
## filter out packages in the default library
my_ipt_notdefault <- my_ipt %>% filter(is.na(Priority))

my_ipt_notdefault_reduced <- my_ipt_notdefault %>% select(Package, Built)

## keep variables Package and Built
## if you use dplyr, code like this will work:
#apt <- ipt %>%
#  filter(LibPath == .libPaths()[1]) %>%
#  select(Package, Built)

## write this new, smaller data frame to data/add-on-packages.csv
write_csv(my_ipt_notdefault_reduced,here("data","add-on-packages.csv"))
## make a frequency table of package by the version in Built
## if you use dplyr, code like this will work:
apt_freqtable <- my_ipt_notdefault_reduced %>%
  count(Built) %>%
  mutate(prop = n / sum(n))

## write this data frame to data/add-on-packages-freqtable.csv
write_csv(apt_freqtable,here("data","add-on-packages-freqtable.csv"))

## YES overwrite the files that are there now
## they came from me (Jenny)
## they are just examples

## when this script works, stage & commit it and the csv files
## PUSH!
