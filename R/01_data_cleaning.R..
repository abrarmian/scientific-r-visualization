# ==============================================================================
# 01_data_cleaning.R
# ==============================================================================
# Purpose:
# Import, inspect, and clean scientific datasets before analysis.
#
# Author:
# Abrar Hussain Mian
# University of Oulu, Finland
#
# This script is designed as a reusable template for biological and
# environmental research datasets.
# ==============================================================================


# 1. Load required packages ----------------------------------------------------

library(readr)
library(dplyr)
library(tidyr)


# 2. Import data ---------------------------------------------------------------

# Replace the example filename with the dataset being analysed.
data <- read_csv("example-data/example_dataset.csv")


# 3. Inspect the dataset -------------------------------------------------------

# View the first rows
head(data)

# Check variable names and data types
glimpse(data)

# Basic summary of variables
summary(data)


# 4. Standardize column names --------------------------------------------------

names(data) <- names(data) |>
  trimws() |>
  tolower() |>
  gsub("[^a-z0-9]+", "_", x = _) |>
  gsub("^_|_$", "", x = _)


# 5. Remove completely empty rows ---------------------------------------------

data_clean <- data |>
  filter(if_any(everything(), ~ !is.na(.x)))


# 6. Check missing values ------------------------------------------------------

missing_values <- data_clean |>
  summarise(across(everything(), ~ sum(is.na(.x))))

print(missing_values)


# 7. Check duplicate rows ------------------------------------------------------

duplicate_rows <- data_clean |>
  duplicated() |>
  sum()

cat("Number of duplicate rows:", duplicate_rows, "\n")


# Remove exact duplicate rows if present
data_clean <- data_clean |>
  distinct()


# 8. Inspect cleaned dataset ---------------------------------------------------

glimpse(data_clean)
summary(data_clean)


# 9. Final quality check -------------------------------------------------------

cat("Original number of rows:", nrow(data), "\n")
cat("Cleaned number of rows:", nrow(data_clean), "\n")
cat("Number of variables:", ncol(data_clean), "\n")


# ==============================================================================
# End of script
# ==============================================================================
