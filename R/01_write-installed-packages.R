library(tidyverse)
library(here)
## deja vu from yesterday!

## create a data frame of your installed packages
ipt <- installed.packages() %>% as_tibble()

## keep the variables
##   * Package
##   * LibPath
##   * Version
##   * Priority
##   * Built
ipt_selected <- ipt %>% select(Package, LibPath, Version, Priority, Built)



## write it to data/installed-packages.csv
write_csv(ipt_selected,here("data","installed-packages.csv"))

## YES overwrite the file that is there now
## that came from me (Jenny)
## it an example of what yours should look like

## when this script works, stage & commit it and the csv file
## PUSH!
