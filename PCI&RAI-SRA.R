#https://youtu.be/HQTxuZ0Mrfc
setwd("G:\\R Programming\\Introduction To R\\")
library(precintcon)
library(tidyverse)
data=read.csv("pci_Rai\\monthly_30days_precip_1980_2023.csv",header = TRUE,stringsAsFactors = F)

library(readxl)
monthly_30days_precip_1980_2023 <- read.csv("pci_Rai/monthly_30days_precip_1980_2023.csv")
View(monthly_30days_precip_1980_2023)


#Calculate PCI 
view(data) # pci_rai_values an object which stores value

as.daily(monthly_30days_precip_1980_2023)
as.monthly(data)
pci()


#Calculate RAI
view(pci_rai_values) # pci_rai_values an object which stores value

rai(as.daily(pci_rai_values,na.value = NA))

rai(as.daily(pci_rai_values,na.value = NA),granularity = "a")


library(precintcon)
library(tidyverse)

# Load daily data
data <- read.csv("daily_precip.csv", header = TRUE, stringsAsFactors = FALSE)

# Convert to daily series compatible with precintcon
daily_precip <- as.daily(data, na.value = NA)

# Calculate PCI
pci_values <- pci(daily_precip)
View(pci_values)

# Calculate RAI
rai_values <- rai(daily_precip, granularity = "a")   # Annual anomaly index
View(rai_values)





# Set working directory to where the files are located
setwd("G:/R Programming/Introduction To R/")

# Load required libraries
library(precintcon)
library(tidyverse)

# Step 1: Load the original monthly/daily precipitation data
#data <- read.csv("monthly_30days_precip_1980_2023.csv", header = TRUE, stringsAsFactors = FALSE)

# Step 2: Rename 'YEAR' and 'Month' columns for consistency, if necessary
colnames(data)[which(tolower(colnames(data)) == "year")] <- "year"
colnames(data)[which(grepl("^month", tolower(colnames(data)) ))] <- "month"

# Step 3: Rename day columns to 'd1' to 'd31'
for (i in 1:31) {
  day_col <- which(colnames(data) == as.character(i))
  if (length(day_col) == 1) {
    colnames(data)[day_col] <- paste0("d", i)
  }
}

# Step 4: Add d31 column for months with <=30 days, fill with NA if missing
if (!("d31" %in% colnames(data))) {
  data$d31 <- NA
}

# Step 5: Select and order columns for as.daily: year, month, d1, ..., d31
columns_daily <- c("year", "month", paste0("d", 1:31))
if ("d31" %in% colnames(data)) {
  columns_daily <- c(columns_daily, "d31")
}
data <- data[, c("year", "month", paste0("d", 1:31))]

# Step 6: Ensure all day columns are numeric
for (i in 3:33) {
  data[[i]] <- as.numeric(data[[i]])
}

# Step 7: Check structure
str(data)
stopifnot(ncol(data) == 33)

# Step 8: Convert to correct daily format and calculate indices
daily_precip <- as.daily(data, na.value = NA)

# Step 9: PCI Calculation
pci_values <- pci(daily_precip)
View(pci_values)

# Step 10: RAI Calculation (annual)
rai_values <- rai(daily_precip, granularity = "a")
View(rai_values)
