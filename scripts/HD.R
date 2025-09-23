LE_HD <- read.csv("data/humandevelopment1990-2021.csv")

library(reshape2)
library(ggplot2)

# Low group
HD_L <- subset(LE_HD, HumanDevelopmentGroups == "Low")
HD_L <- HD_L[, grep("^X[0-9]{4}$", names(HD_L))]
HD_L_re <- melt(HD_L, variable.name = "Year", value.name = "Value")
HD_L_re$Year <- as.numeric(sub("X", "", HD_L_re$Year))
ggplot(HD_L_re, aes(x = Year, y = Value)) + geom_jitter(alpha = 0.5) +
  geom_smooth(method = "lm", color = "red", se = FALSE)

# Medium group
HD_M <- subset(LE_HD, HumanDevelopmentGroups == "Medium")
HD_M <- HD_M[, grep("^X[0-9]{4}$", names(HD_M))]
HD_M_re <- melt(HD_M, variable.name = "Year", value.name = "Value")
HD_M_re$Year <- as.numeric(sub("X", "", HD_M_re$Year))
ggplot(HD_M_re, aes(x = Year, y = Value)) + geom_jitter(alpha = 0.5) +
  geom_smooth(method = "lm", color = "red", se = FALSE)

# High group
HD_H <- subset(LE_HD, HumanDevelopmentGroups == "High")
HD_H <- HD_H[, grep("^X[0-9]{4}$", names(HD_H))]
HD_H_re <- melt(HD_H, variable.name = "Year", value.name = "Value")
HD_H_re$Year <- as.numeric(sub("X", "", HD_H_re$Year))
ggplot(HD_H_re, aes(x = Year, y = Value)) + geom_jitter(alpha = 0.5) +
  geom_smooth(method = "lm", color = "red", se = FALSE)

# Very High group
HD_VH <- subset(LE_HD, HumanDevelopmentGroups == "VeryHigh")
HD_VH <- HD_VH[, grep("^X[0-9]{4}$", names(HD_VH))]
HD_VH_re <- melt(HD_VH, variable.name = "Year", value.name = "Value")
HD_VH_re$Year <- as.numeric(sub("X", "", HD_VH_re$Year))
ggplot(HD_VH_re, aes(x = Year, y = Value)) + geom_jitter(alpha = 0.5) +
  geom_smooth(method = "lm", color = "red", se = FALSE)
