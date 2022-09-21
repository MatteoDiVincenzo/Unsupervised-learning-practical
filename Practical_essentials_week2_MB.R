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

# Now creating a boxplot 

geom_boxplot(outlier.colour="black", outlier.shape=16, outlier.size=2, notch=FALSE)
p_2 <- ggplot(i, aes(x=Sex, y=Weight, color=Sex, title="Plot of weight per sex")) + 
  geom_boxplot(outlier.colour="black", outlier.shape=8, outlier.size=2) + 
  labs(title="Plot of weight per sex",x="Sex", y = "Weight (g)")+
  theme_classic()
p_2

