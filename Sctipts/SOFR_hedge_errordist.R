#--------------------
library(tidyverse)
library(patchwork)
library(ggthemes)
library(latex2exp)
#--------------------

df <- read_csv("ER12.csv") %>% as_tibble()

#ER1:
mean_ER1 <- round(mean(df$ER1), 2)
sd_ER1 <- round(sd(df$ER1),2)

#ER2: 
mean_ER2 <- round(mean(df$ER2), 2)
sd_ER2 <- round(sd(df$ER2),2)



p1 <- ggplot(df, aes(x=ER1)) + 
  geom_histogram(bins=1000) + 
  geom_vline(aes(xintercept = mean_ER1),
             color="blue", linetype="dashed", size=1) + 
  theme_minimal()  + 
  theme(axis.title.y = element_blank()) + 
  xlab(TeX("$ER_{1}(0)$"))


p2 <- ggplot(df, aes(x=ER2)) + 
  geom_histogram(bins=1000) + 
  geom_vline(aes(xintercept = mean_ER2),
             color="orange", linetype="dashed", size=1) + 
  theme_minimal() + 
  theme(axis.title.y = element_blank()) + 
  xlab(TeX("$ER_{2}(0)$"))

p <- p1/p2

ggsave(filename = "SOFR_error_plt.png",
       plot = last_plot(),
       dpi = 300,
       height = 8,
       width = 12, units = "cm")
 
             