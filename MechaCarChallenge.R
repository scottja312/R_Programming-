# MPG Regression Analysis
# Load Dataset
setwd("~/Desktop/Berkeley/R-Studio/R_Analysis/R-Module-14/R_Programming-") #set working directory
mechacar_mpg <- read.csv('MechaCar_mpg.csv',stringsAsFactors = F) #read in dataset
head(mechacar_mpg) # inspect head of values
  vehicle.length vehicle.weight spoiler.angle ground.clearance AWD      mpg
1       14.69710       6407.946      48.78998         14.64098   1 49.04918
2       12.53421       5182.081      90.00000         14.36668   1 36.76606
3       20.00000       8337.981      78.63232         12.25371   0 80.00000
4       13.42849       9419.671      55.93903         12.98936   1 18.94149
5       15.44998       3772.667      26.12816         15.10396   1 63.82457
6       14.45357       7286.595      30.58568         13.10695   0 48.54268

#View comprehensive table for independent and dependent values
 View(mechacar_mpg)

# Perform Multiple Linear Regression 
# Designate mpg as the independent variable
# Designate dependent variables: vehicle.length, vehicle.weight, spoiler.angle, ground.clearance, AWD (all-wheel drive))
lm(mpg ~ vehicle.length + vehicle.weight + spoiler.angle + ground.clearance + AWD, data = mechacar_mpg) #generate multiple linear regression model
# Output information:
Call:
lm(formula = mpg ~ vehicle.length + vehicle.weight + spoiler.angle + 
    ground.clearance + AWD, data = mechacar_mpg)

Coefficients:
     (Intercept)    vehicle.length    vehicle.weight     spoiler.angle  
      -1.040e+02         6.267e+00         1.245e-03         6.877e-02  
ground.clearance               AWD  
       3.546e+00        -3.411e+00  
