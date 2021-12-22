######################################
## LOAD MESSAGE DATA INTO WORKSPACE ##
######################################
# Load initial data and model
load("employeedata.RData")
# Load data supplied from message flows
load("messageFlowData.RData")

###################################################
## PLOT GRAPHS OF TRAINING DATA AGAINST NEW DATA ##
###################################################

# Prettify graphs
opar <- par(no.readonly=TRUE)
par(mfrow=c(2,1), cex.axis=.75)
# Original data
plot(employeedata$ed.level, employeedata$salary,
  main="Original Data",
  xlab="Years of Education",
  ylab="Salary (£ GBP)")

# New data as highlighted points
plot(employeedata$ed.level, employeedata$salary,
  main="With Data from Message Flows",
  xlab="Years of Education",
  ylab="Salary (£ GBP)")
points(mfdata$ed.level, mfdata$salary, pch=16, col="blue")
# Plot regression line
abline(model, col="red")

# Reset to original graphical parameters
par(opar)