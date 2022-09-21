install.packages("tidyverse")
library(tidyverse)
i = read.csv2("Scorings.csv")

ggplot(i, aes(x = Weight)) + 
  geom_histogram(aes(fill = Sex,
                     color = Sex),
                 position="dodge") +
  scale_color_manual(values = c("#cb4740", "#76a4dc")) +
  scale_fill_manual(values = c("#e49d99", "#caddf1")) +
  facet_wrap(~`Date`, scales="free") +
  theme_minimal() +
  theme(legend.position = "top") +
  theme(text = element_text(size = 14),
        legend.title = element_text(size = 15),
        strip.text.x = element_text(face = "bold.italic")) +
  labs(x = NULL, y = NULL) +
  ggtitle("Chickens' weight distribution per date and sex")
