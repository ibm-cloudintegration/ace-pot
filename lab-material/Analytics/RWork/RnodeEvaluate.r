############################################
## Called for every trip from R node to R ##
############################################
#
#####################################
## LOAD UP PREVIOUS DATA IF EXISTS ##
#####################################
#
if (file.exists("messageFlowData.RData")) {
  # will load out mfdata object which contains all data from previous messages
  load("messageFlowData.RData")
} else {
  # Create mfdata so that we can merge the two data sets later
  mfdata <- data.frame( ed.level = numeric(), salary = numeric())
}
#
###############################
## PREDICT INCOME FROM GRADS ##
###############################
#
# Predict Income column from inputted data and round up
#
newdata <- transform(newdata, salary = ceiling(predict(model, newdata = newdata)))
#
# print out the new data to the output file
#
print(newdata)
#
####################################
## SAVE DATA TO DISK AND CLEAN UP ##
####################################
# Add new data to existing data from previous messages
#
mfdata <- rbind(mfdata, newdata)
#
# Save to disK (directory determined by setwd() above)
#
save(mfdata, file = "messageFlowData.RData")
#
# 
#