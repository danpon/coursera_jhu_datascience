library(dplyr)
library(ggplot2)
library(cowplot)


ToothGrowth$dose <- as.factor(ToothGrowth$dose)
p_all <- ggplot(ToothGrowth, aes(x=dose, y=len)) + 
    geom_boxplot()


p_by_dose <- ggplot(ToothGrowth, aes(x=dose, y=len, fill=supp)) +
    geom_boxplot()

plot_grid(p_all, p_by_dose, labels=c("A", "B"), ncol = 2, nrow = 1)


        
ToothGrowth %>% group_by(dose) %>% summarize(mean=mean(len), sd=sd(len))
ToothGrowth %>% 
    group_by(dose,supp) %>% 
    summarize(mean=mean(len), sd=sd(len)) %>%
    arrange(supp,dose)


ToothGrowth$dose <- as.numeric(as.character(ToothGrowth$dose))



d0.5 <- ToothGrowth %>% filter(dose==0.5) %>% select(len)
d2.0 <- ToothGrowth %>% filter(dose==2) %>% select(len)


t.test(d2.0,d0.5,paired=FALSE)


OJ <- ToothGrowth %>% filter(supp=="OJ",dose<2) %>% select(len)
VC <- ToothGrowth %>% filter(supp=="VC",dose<2) %>% select(len)

t.test(OJ,VC,paired=FALSE)

OJ <- ToothGrowth %>% filter(supp=="OJ",dose==2) %>% select(len)
VC <- ToothGrowth %>% filter(supp=="VC",dose==2) %>% select(len)

t.test(OJ,VC,paired=FALSE)