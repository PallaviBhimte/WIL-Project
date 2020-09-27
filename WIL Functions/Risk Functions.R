library(dplyr)
library(magrittr)
library(readr)


# Demographics: Age and Ethnicity used for calculation, gender just in shiny app demographic selectiong 
# for data gathering purposes. All necessary values are within the AgeEthnicity Dataset.

AgeEthnicity <- read_csv("AgeEthnicity.csv")
AgeEthnicity <- na.omit(AgeEthnicity)

# Get values to be used in drop down list for age

ageValues <- AgeEthnicity$Age %>% unique()


#Get values to be used in drop down list for ethnicity

ethValues <- AgeEthnicity$Ethnicity %>% unique()

#Functionality wise, in the Shiny app, selecting the age will take a subset of the data for that age,
# then by selecting ethnicity it is matched to the correct row of the data. The Risk band value would 
# then be selected. Based on that value (LOW, SOME, MODERATE, HIGH, VERy HIGH), we could either return an
# Image with the relevant risk information, or formatted text. There is a rough sketch included in the repository
# of what i was thinking.

#Comorbidities: No dataset, just values as seen here. cmorbRates just for interest, cmorbRisk all we really need to
# return correct risk. Same return type as demographics.

comorb <- list( asthma = 'Asthma', obs = 'Obesity', diab = 'Diabetes', ckd = 'Chronic Kidney Disease', 
                sevObs = 'Severe Obesity', cad = 'Corondary Artery Disease', sHis = 'History of Stroke', 
                condX2 = '2 Conditions from list', condX3 = '3 or More conditions from list', none = 'No known conditions'
)

cmorbRates <- list(asthmaR = 1.5, obsR = 3, diabR = 3, ckdR = 4, sevObsR = 4.5, cadR = 4,
                   sHisR = 4, condX2R = 4.5, condX3R = 5, noneR = 0
)
cmorbRisk <- list(asthmaR = 'MODERATE', obsR = 'MODERATE', diabR = 'MODERATE', ckdR = 'HIGH', sevObsR = 'HIGH', cadR = 'HIGH',
                  sHisR = 'HIGH', condX2R = 'HIGH', condX3R = 'VERY HIGH', noneR = 'LOW')

#Occupation: Not sure if we should subset data by major occupational group, and then by occupation for dropdown lists. would
# be easier for user to find a job to select. Same as demographic, functionality wise by a person selecting the job from the drop down
# list, that can be used to get the correct risk band from the risk band column. same return type as demographcis. 

Jobs <- read_csv("JobsCovid.csv")

occGroups <- Jobs$`Major Occupational Group` %>% unique()

jobsValues <- Jobs$Occupation




