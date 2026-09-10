# ==============================================================================
# 02_summary_statistics.R
# ==============================================================================
# Purpose:
# Calculate descriptive statistics for experimental scientific data.
#
# Author:
# Abrar Hussain Mian
# University of Oulu, Finland
#
# Example data used in this script are synthetic and are provided only to
# demonstrate a reproducible analytical workflow.
# ==============================================================================


# 1. Load required packages ----------------------------------------------------

library(readr)
library(dplyr)


# 2. Import example dataset ----------------------------------------------------

data <- read_csv("example-data/example_dataset.csv")


# 3. Inspect data --------------------------------------------------------------

glimpse(data)


# 4. Calculate summary statistics ---------------------------------------------

summary_statistics <- data |>
  group_by(treatment, time_h) |>
  summarise(
    n = n(),
    mean_concentration = mean(concentration_mg_l, na.rm = TRUE),
    sd_concentration = sd(concentration_mg_l, na.rm = TRUE),
    se_concentration = sd_concentration / sqrt(n),
    min_concentration = min(concentration_mg_l, na.rm = TRUE),
    max_concentration = max(concentration_mg_l, na.rm = TRUE),
    .groups = "drop"
  )


# 5. Display results -----------------------------------------------------------

print(summary_statistics)


# 6. Round values for reporting -----------------------------------------------

summary_report <- summary_statistics |>
  mutate(
    across(
      c(
        mean_concentration,
        sd_concentration,
        se_concentration,
        min_concentration,
        max_concentration
      ),
      ~ round(.x, 3)
    )
  )

print(summary_report)


# 7. Quality check -------------------------------------------------------------

cat("Number of treatments:", n_distinct(data$treatment), "\n")
cat("Number of time points:", n_distinct(data$time_h), "\n")
cat("Total observations:", nrow(data), "\n")


# ==============================================================================
# End of script
# ==============================================================================
