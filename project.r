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
#View(gaming_clean)

summary(gaming_clean)

describe(gaming_clean %>% select(Age, Hours, GAD_T, SPIN_T, SWL_T, Narcissism))

# horas jugadas
ggplot(gaming_clean, aes(x = Hours)) +
  geom_histogram(fill = "steelblue", bins = 30, alpha = 0.7) +
  theme_minimal() +
  labs(title = "Distribución de horas de juego semanales",
       x = "Horas jugadas por semana", y = "Participantes")

# ansiedad (GAD)
ggplot(gaming_clean, aes(x = GAD_T)) +
  geom_histogram(fill = "orange", bins = 30, alpha = 0.7) +
  theme_minimal() +
  labs(title = "Distribución de ansiedad (GAD_T)",
       x = "Puntaje total GAD", y = "Participantes")

# aatisfaccion con la vida
ggplot(gaming_clean, aes(x = SWL_T)) +
  geom_histogram(fill = "darkgreen", bins = 30, alpha = 0.7) +
  theme_minimal() +
  labs(title = "Distribución de satisfacción con la vida (SWL_T)",
       x = "Puntaje SWL_T", y = "Participantes")
