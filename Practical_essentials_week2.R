library(tidyverse)
i= read.csv2("chickens.csv")

i_w_mean = group_by(i, Sex) %>%
  summarise(weight_mean = mean(Weight), weigh_median = median(Weight)) %>%
  merge(x=, y=i, by="Sex")  

ggplot(i_w_mean, aes(x=Weight, color=Sex, fill=Sex)) +
  geom_histogram(aes(y=..density..), position="identity", alpha=0.5)+
  geom_density(alpha=0.6)+
   geom_vline(data=i_w_mean, aes(xintercept=weight_mean, color=Sex),
              linetype="dashed") +
  geom_vline(data=i_w_mean, aes(xintercept=weigh_median, color=Sex),
             linetype="dashed")+
  scale_color_manual(values=c("#999999", "#E69F00", "#56B4E9"))+
  scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9")) + 
  labs(title="Weight histogram plot")+
  theme_classic()

