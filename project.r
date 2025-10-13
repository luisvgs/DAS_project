library(dplyr)
library(readr)

gaming <- read_csv("GamingStudy_data.csv")

names(gaming)

gaming_clean <- gaming %>%
  select(
    -Zeitstempel,
    -Reference,
    -accept,
    -earnings,
    -League,
    -highestleague,
    -Residence_ISO3
  ) %>%
  distinct() %>%
  filter(
    !is.na(Age),
    !is.na(GAD_T),
    !is.na(SWL_T),
    !is.na(SPIN_T)
  )

glimpse(gaming_clean)
summary(gaming_clean)

gaming_clean <- gaming_clean %>%
  filter(Hours <= 100)

write_csv(gaming_clean, "GamingStudy_clean.csv")
