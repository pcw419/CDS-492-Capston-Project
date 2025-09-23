LE_ctin <- read.csv("data/continent1990-2021.csv")

library(ggplot2)
library(reshape2)
library(dplyr)
library(tidyr)

# Boxplots
ggplot(LE_ctin, aes(x = Continent, y = X1990)) +
  geom_boxplot() + theme_minimal()
ggplot(LE_ctin, aes(x = Continent, y = X2021)) +
  geom_boxplot() + theme_minimal()

# Reshape and summarize
ctin_box <- melt(LE_ctin, id.vars = "Continent",
                 measure.vars = paste0("X", 1990:2021),
                 variable.name = "Year",
                 value.name = "LifeExpectancy")
ctin_box$Year <- as.numeric(gsub("X", "", ctin_box$Year))

summary_stats <- ctin_box %>%
  group_by(Continent, Year) %>%
  summarise(Mean = mean(LifeExpectancy, na.rm = TRUE),
            Median = median(LifeExpectancy, na.rm = TRUE),
            Min = min(LifeExpectancy, na.rm = TRUE),
            Max = max(LifeExpectancy, na.rm = TRUE))

print(summary_stats)

# Scatterplot by continent
ggplot(ctin_box, aes(x = Year, y = LifeExpectancy, color = Continent)) +
  geom_point() + geom_smooth(se = FALSE) +
  facet_wrap(~ Continent, ncol = 2) + theme_minimal()

# ANOVA
conv1990and2021 <- aov(X1990 ~ Continent, data = LE_ctin)
summary(conv1990and2021)
print(TukeyHSD(conv1990and2021))
