GDP <- read.csv("data/yearGDPgrowth.csv")

library(ggplot2)
library(dplyr)
library(tidyr)

# Convert to long format
colnames(GDP) <- gsub("^X", "", colnames(GDP))
GDP <- GDP %>%
  pivot_longer(cols = matches("^[0-9]{4}$"), names_to = "Year", values_to = "GDP") %>%
  mutate(Year = as.integer(Year), GDP = as.numeric(GDP)) %>%
  filter(!is.na(GDP))

# 1990 vs 2021 top/bottom 10
GDP1990 <- GDP %>% filter(Year == 1990)
GDP2021 <- GDP %>% filter(Year == 2021)

top10_1990 <- GDP1990 %>% arrange(desc(GDP)) %>% head(10)
low10_1990 <- GDP1990 %>% arrange(GDP) %>% head(10)

top10_2021 <- GDP2021 %>% arrange(desc(GDP)) %>% head(10)
low10_2021 <- GDP2021 %>% arrange(GDP) %>% head(10)

# Plots
ggplot(top10_1990, aes(x = reorder(Country.Name, GDP), y = GDP)) +
  geom_bar(stat = "identity", fill = "steelblue") + coord_flip()

ggplot(low10_1990, aes(x = reorder(Country.Name, GDP), y = GDP)) +
  geom_bar(stat = "identity", fill = "salmon") + coord_flip()

ggplot(top10_2021, aes(x = reorder(Country.Name, GDP), y = GDP)) +
  geom_bar(stat = "identity", fill = "steelblue") + coord_flip()

ggplot(low10_2021, aes(x = reorder(Country.Name, GDP), y = GDP)) +
  geom_bar(stat = "identity", fill = "salmon") + coord_flip()
