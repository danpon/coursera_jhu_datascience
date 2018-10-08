#1 
# A pharmaceutical company is interested in testing a potential blood pressure lowering 
# medication. Their first examination considers only subjects that received the medication at 
#baseline then two weeks later. The data are as follows (SBP in mmHg)
baseline <- c(140,138,150,148,135)
week2 <- c(132,135,151,146,130)
#Consider testing the hypothesis that there was a mean reduction in blood pressure? 
#Give the P-value for the associated two sided T test. 

#H0 :μd =0 versus Ha:μd≠0  μd is the mean difference between followup and baseline.

t.test(baseline,week2,paired = TRUE,alternative = "two.sided")
### value= 0.087 OK

#2 A sample of 9 men yielded a sample average brain volume of 1,100cc and a standard
# deviation of 30cc. What is the complete set of values of μ0 
# that a test of H0:μ would fail to reject the null hypothesis 
# in a two sided 5% Students t-test? 

#This is the 95% student's T confidence interval.
1100 +c(-1,1)*qt(p=0.975,df=8)*30/sqrt(9)
### value =  [1076.94 1123.06] OK

#3 Researchers conducted a blind taste test of Coke versus Pepsi. 
# Each of four people was asked which of two blinded drinks 
# given in random order that they preferred. 
# The data was such that 3 of the 4 people chose Coke.
#  Assuming that this sample is representative, 
# report a P-value for a test of the hypothesis 
# that Coke is preferred to Pepsi using a one sided exact test.

#Let p  be the proportion of people who prefer Coke. Then, we want to test
# H0:p=.5 versus Ha: Ha:p>5. Let X  be the number out of 4 coke
# testers prefer 
#Pvalue= P(X≥3) =choose(4,3)0.5^3.5^1+choose(4,4)0.5^4*0.5
#pbinom(2, size = 4, prob = 0.5, lower.tail = FALSE) 2 instead of 3 beacause lower test= FALSE
binom.test(3,4,(1/2),alternative="greater")
### value=0.3125 OK

#4 Infection rates at a hospital above 1 infection per 100 person days at risk 
# are believed to be too high and are used as a benchmark
# A hospital that had previously been above the benchmark recently 
# had 10 infections over the last 1,787 person days at risk.
# About what is the one sided P-value for the relevant test of 
# whether the hospital is *below* the standard? 
# NB : below the standard = < 10% (BETTER THAN THE STANDARD)
ppois(10,lambda=17.87) 
### VALUE= 0.03


#5 Suppose that 18 obese subjects were randomized, 9 each, to a 
# new diet pill and a placebo.
# Subjects’ body mass indices (BMIs) were measured at a
# baseline and again after having  received the treatment or 
# placebo for four weeks.
# The average difference from follow-up to the baseline (followup - baseline) was 
# −3 kg/m2 for the treated group  andd 1 kg/m2 for the placebo group. 
# The corresponding standard deviations of the differences was 1.5 kg/m2 for 
# the treatment group and 1.8 kg/m2 for the placebo group.
# Does the change in BMI appear to differ between the treated and placebo groups?
# Assuming normality of the underlying data and a common population variance, 
# give a pvalue for a two sided t test.
n1 <- 9
n2 <- 9
s1 <- 1.8
s2 <- 1.5
m1 <- 1
m2 <- -3
sp <-  sqrt(((n1-1)*s1^2 +(n2-1)*s2^2)/(n1+n2-2))
t<- (m1-m2)/sp/sqrt(1/n1+1/n2)
2*pt(-abs(t),df=n1+n2-2) ##########?

# Less than 0.10 but larger than 0.05 WRONG
# Less than 0.05, but larger than 0.01 WRONG
# Larger than 0.10 WRONG 
###Less than 0.01

#6 Brain volumes for 9 men yielded a 90% confidence interval of 1,077 cc 
# to 1,123 cc. Would you reject in a two sided 5% hypothesis test of  
# H0:μ=1,078 ?
# No, you would fail to reject. The 95% interval would be wider than the 90% interval. 
# Since 1,078 is in the narrower 90% interval, it would also be in the wider 95% interval. 
# Thus, in either case it's in the interval and so you would fail to reject.

### No you wouldn't reject OK

#7 Researchers would like to conduct a study of 100  healthy adults to detect a four
# year mean brain volume loss of .01 mm3.
# Assume that the standard deviation of four year volume loss in this population is 
#.04 mm3 .About what would be the power of the study for a 5% 
# one sided test versus a null hypothesis of no volume loss?

# H0 diffmean =0 , Ha diffmean >0
# first find intesrection between curves H0 et Ha.
# This intersection is such that (according to H0) (Xd -0)/(sigma/sqrt(n)) > Z95 =1.645 
# now we claculate Power P(Xd/(sigma/sqrt(n)) > 1.645 with Ha (mean=0.0.1 instead of 0))


###0.80 OK

#8 
# Researchers would like to conduct a study of n healthy adults 
# to detect a four year mean brain volume loss of .01 mm3
# Assume that the standard deviation of four year volume loss in this population is .04 mm3
# About what would be the value of n  needed for 90%  power of type one error rate of 5%
# one sided test versus a null hypothesis of no volume loss?

#140  OK

#YOU WILL GET LARGE POWER OK
