---------------------------
# MPG Regression Analysis
----------------------------
# Load Dataset
---------------
> setwd("~/Desktop/Berkeley/R-Studio/R_Analysis/R-Module-14/R_Programming-") #set working directory
> mechacar_mpg <- read.csv('MechaCar_mpg.csv',stringsAsFactors = F) #read in dataset
> head(mechacar_mpg) # inspect head of values
  vehicle.length vehicle.weight spoiler.angle ground.clearance AWD      mpg
1       14.69710       6407.946      48.78998         14.64098   1 49.04918
2       12.53421       5182.081      90.00000         14.36668   1 36.76606
3       20.00000       8337.981      78.63232         12.25371   0 80.00000
4       13.42849       9419.671      55.93903         12.98936   1 18.94149
5       15.44998       3772.667      26.12816         15.10396   1 63.82457
6       14.45357       7286.595      30.58568         13.10695   0 48.54268

#View comprehensive table for independent and dependent values
> View(mechacar_mpg)
-------------------------------------
# Perform Multiple Linear Regression 
-------------------------------------
# Designate mpg as the independent variable
# Designate dependent variables: vehicle.length, vehicle.weight, spoiler.angle, ground.clearance, AWD (all-wheel drive))
> lm(mpg ~ vehicle.length + vehicle.weight + spoiler.angle + ground.clearance + AWD, data = mechacar_mpg) #generate multiple linear regression model
# Output information:
Call:
lm(formula = mpg ~ vehicle.length + vehicle.weight + spoiler.angle + 
    ground.clearance + AWD, data = mechacar_mpg)

Coefficients:
     (Intercept)    vehicle.length    vehicle.weight     spoiler.angle  
      -1.040e+02         6.267e+00         1.245e-03         6.877e-02  
ground.clearance               AWD  
       3.546e+00        -3.411e+00  

# Obtain statistical metrics from MPG multiple linear regression:
> summary(lm(mpg ~ vehicle.length + vehicle.weight + spoiler.angle + ground.clearance + AWD, data = mechacar_mpg)) #generate summary statistics
# Output information:
Call:
lm(formula = mpg ~ vehicle.length + vehicle.weight + spoiler.angle + 
    ground.clearance + AWD, data = mechacar_mpg)

Residuals:
     Min       1Q   Median       3Q      Max 
-19.4701  -4.4994  -0.0692   5.4433  18.5849 

Coefficients:
                   Estimate Std. Error t value Pr(>|t|)    
(Intercept)      -1.040e+02  1.585e+01  -6.559 5.08e-08 ***
vehicle.length    6.267e+00  6.553e-01   9.563 2.60e-12 ***
vehicle.weight    1.245e-03  6.890e-04   1.807   0.0776 .  
spoiler.angle     6.877e-02  6.653e-02   1.034   0.3069    
ground.clearance  3.546e+00  5.412e-01   6.551 5.21e-08 ***
AWD              -3.411e+00  2.535e+00  -1.346   0.1852    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 8.774 on 44 degrees of freedom
Multiple R-squared:  0.7149,	Adjusted R-squared:  0.6825 
F-statistic: 22.07 on 5 and 44 DF,  p-value: 5.35e-11

------------------------
# Suspension Coil Summary
------------------------
# Load Dataset
> suspension_coil <- read.csv('Suspension_Coil.csv',stringsAsFactors = F) #read in dataset
> head(suspension_coil) # inspect head of values
 VehicleID Manufacturing_Lot      PSI
1    V40858              Lot1 1498.763
2    V40607              Lot1 1500.002
3    V31443              Lot1 1500.643
4     V6004              Lot1 1500.260
5     V7000              Lot1 1498.403
6    V17344              Lot1 1499.676

-----------------------------------------------------------------------------
#Summary statistics for suspension coil's pounds-per-inch continuous variable
#prepare summary tables for manufacturing lot and vehicle ID
> suspension_coil_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean_PSI=mean(PSI))
> head(suspension_coil_summary)
# A tibble: 3 x 2
  Manufacturing_Lot Mean_PSI
  <chr>                <dbl>
1 Lot1                 1500.018
2 Lot2                 1499.571
3 Lot3                 1499.004

# Metrics (mean, median, variance, standard deviation)
> suspension_coil_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean_PSI=mean(PSI),SD_PSI=sd(PSI),Median_PSI=median(PSI),var_PSI=var(PSI))
# A tibble: 3 x 5
  Manufacturing_Lot Mean_PSI   SD_PSI      Median_PSI   var_PSI
  <chr>                <dbl>     <dbl>      <dbl>        <dbl>
1 Lot1                 1500.018   1.070525     1500.206     1.146024
2 Lot2                 1499.571   3.183003     1499.873     10.131511 
3 Lot3                 1499.004   14.832753    1498.981     220.010563  

-------------------------------------------------------------------------------
# Suspension Coil T-Test
# one-sample t-test
> suspension_coil <- read.csv('Suspension_Coil.csv',stringsAsFactors = F) #read in dataset
> sample_coil <- suspension_coil %>% sample_n(50) # randomly sample 50 data points
> t.test(log10(sample_coil$PSI),mu=mean(log10(suspension_coil$PSI))) #compare sample versus population means
# Results:
One Sample t-test
data:  log10(sample_coil$PSI)
t = 1.0177, df = 49, p-value = 0.3138
alternative hypothesis: true mean is not equal to 3.175948
95 percent confidence interval: 
3.175745 3.176568
sample estimates:
mean of x 
 3.176157 

# two-sample t-test
> sample_coil <- suspension_coil %>% sample_n(50) # randomly sample 50 data points
> sample_coil2 <- suspension_coil %>% sample_n(50) # randomly sample another 50 data points
# test if samples contain bias
> t.test(log10(sample_coil$PSI),log10(sample_coil2$PSI)) #compare means of two samples
# Results:
Welch Two Sample t-test

data:  log10(sample_coil$PSI) and log10(sample_coil2$PSI)
t = 0.57496, df = 95.704, p-value = 0.5667
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -0.0004444800  0.0008069442
sample estimates:
mean of x mean of y 
 3.176157  3.175975 