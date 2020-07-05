#Install packages
#install.packages("devtools")
#devtools::install_github("rstudio/keras")
#install.packages('keras')
#install.packages('tensorflow')

library(keras)
library(tensorflow)
install_keras()
install_tensorflow()


# Read data
data <- read.csv(file.choose(), header = T)
str(data)

# Change to matrix
data <- as.matrix(data)
dimnames(data) <- NULL

# Normalize
data[, 1:21] <- normalize(data[, 1:21])
data[,22] <- as.numeric(data[,22]) -1
summary(data)


# Data partition
set.seed(1234) #simulate some data
ind <- sample(2, nrow(data), replace = T, prob = c(0.3, 0.7))
training <- data[ind==1 , 1:21]
test <- data[ind==2 , 1:21]
trainingtarget <- data[ind==1, 22]
testtarget <- data[ind==2, 22]

# One Hot Encoding
#converting the target variable to once hot encoded vectors using keras inbuilt function
trainLabels <- to_categorical(trainingtarget,2)

