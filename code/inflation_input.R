
install.packages("readxl")
library(readxl)
library(tidyverse)



download.file("https://www.ons.gov.uk/file?uri=/economy/inflationandpriceindices/datasets/consumerpriceinflation/current/consumerpriceinflationdetailedreferencetables.xlsx","temp.xlsx")

data_1 <- as.data.frame(readxl::read_excel("temp.xlsx", sheet = "Table 57", skip = 5, col_names = TRUE))

data_1 <- data_1 %>% 
            dplyr::filter(!row_number() %in% c(1)) %>%
            rename("date" = c(1))

save(data_1 , file = "data/ons_table57.Rdata")
