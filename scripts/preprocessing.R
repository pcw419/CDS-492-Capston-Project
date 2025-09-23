# preprocessing.R
# Purpose: Generate analysis-ready datasets from raw life expectancy files
# Author: Chaewon Park
# Date: 2025-09-22

# Load raw datasets
LEB <- read.csv("Life Expectancy at Birth.csv")
LE  <- read.csv("LifeExpectancy.csv")

# -----------------------------
# Country-level dataset
# Keep only country + life expectancy values (1990–2021)
# -----------------------------
LE_ctry <- LE[-c(1, 3, 4, 5, 6, 7)]
write.csv(LE_ctry, "country1990-2021.csv", row.names = FALSE)

# -----------------------------
# Continent-level dataset
# Keep only continent + life expectancy values (1990–2021)
# -----------------------------
LE_ctin <- LE[-c(1, 2, 4, 5, 6, 7)]
write.csv(LE_ctin, "continent1990-2021.csv", row.names = FALSE)

# -----------------------------
# Human Development dataset
# Keep only HDI groups + life expectancy values (1990–2021)
# -----------------------------
LE_HD <- LE[-c(1, 2, 3, 4, 6, 7)]
write.csv(LE_HD, "humandevelopment1990-2021.csv", row.names = FALSE)