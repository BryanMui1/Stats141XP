# loading required libraries
library(readxl)
library(maditr)
library(tidyverse)
library(sjPlot)
library(logistf)

main <- read_csv("last_v4.csv")

# create logist model
fir <- logistf(antibiotics_after_procedure_less_thirty ~ 
                 category2 + Autoimmune.disease + Diabetes + 
                 Immunocompromise + Tobacco.use + Vascular.disease + 
                 multiple_encounters + mohs + elix_vw_score + preventive_antibiotics, 
               data = main, firth = T, pl = T)

# view model results
summary(fir)

# view coefficients 
exp(coef(fir))

# view 95% confidence intervals
round(exp(cbind(Estimate=coef(fir), confint(fir))), 4)

# plot 
plot_model(fir) 
