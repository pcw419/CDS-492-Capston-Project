LE_ctry <- read.csv("data/country1990-2021.csv")

library(ggplot2)
library(dplyr)

# Boxplots
ggplot(LE_ctry, aes(x = Country, y = X1990)) +
  geom_boxplot() +
  xlab('Country') + ylab('Life Expectancy in 1990') +
  ggtitle('Country Life Expectancy in 1990') +
  theme_minimal() + theme(axis.text.x = element_text(angle = 90, hjust = 1))

ggplot(LE_ctry, aes(x = Country, y = X2021)) +
  geom_boxplot() +
  xlab('Country') + ylab('Life Expectancy in 2021') +
  ggtitle('Country Life Expectancy in 2021') +
  theme_minimal()

# Histograms
ggplot(LE_ctry, aes(x = reorder(Country, X1990), y = X1990, fill = X1990)) +
  geom_bar(stat = "identity") +
  labs(x = "Country", y = "1990 Life Expectancy") +
  scale_fill_gradient(low = "lightblue", high = "darkblue") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

ggplot(LE_ctry, aes(x = reorder(Country, X2021), y = X2021, fill = X2021)) +
  geom_bar(stat = "identity") +
  labs(x = "Country", y = "2021 Life Expectancy") +
  scale_fill_gradient(low = "lightblue", high = "darkblue") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

# Change from 1990 to 2021
LE_ctry$Change_1990_2021 <- LE_ctry$X2021 - LE_ctry$X1990
max_change <- LE_ctry[which.max(LE_ctry$Change_1990_2021), c("Country", "Change_1990_2021")]
min_change <- LE_ctry[which.min(LE_ctry$Change_1990_2021), c("Country", "Change_1990_2021")]
print(max_change)
print(min_change)

# Top 5 and Low 5 countries per year
top_5_countries_each_year <- lapply(names(LE_ctry)[3:ncol(LE_ctry)], function(year) {
  LE_ctry_up5 <- LE_ctry %>%
    select(Country, !!sym(year)) %>%
    arrange(desc(!!sym(year))) %>%
    head(5) %>%
    mutate(Year = year)
  colnames(LE_ctry_up5) <- c("Country", "Life_Expectancy", "Year")
  return(LE_ctry_up5)
})
top_5_countries_each_year_df <- do.call(rbind, top_5_countries_each_year)

low_5_countries_each_year <- lapply(names(LE_ctry)[3:ncol(LE_ctry)], function(year) {
  LE_ctry_low5 <- LE_ctry %>%
    select(Country, !!sym(year)) %>%
    arrange(!!sym(year)) %>%
    head(5) %>%
    mutate(Year = year)
  colnames(LE_ctry_low5) <- c("Country", "Life_Expectancy", "Year")
  return(LE_ctry_low5)
})
low_5_countries_each_year_df <- do.call(rbind, low_5_countries_each_year)

print(top_5_countries_each_year_df)
print(low_5_countries_each_year_df)
