# Load the required package 
#https://youtu.be/XhU4xoygJ6Q
library(modifiedmk)

# Set your working directory and read the data
#setwd("D:/Research/Temperature and public perception/ERA5/ETCCDI")
dat <- read.csv("TFMK.csv", header = TRUE)

# Specify columns to analyze (for example, from columns 3 to 30)
columns_to_analyze <- 3:10

# Create an empty data frame to store results
result_df <- data.frame(
  Column = integer(length(columns_to_analyze)),
  Z_Value = numeric(length(columns_to_analyze)),
  Sen_Slope = numeric(length(columns_to_analyze)),
  old_Sen_Slope = numeric(length(columns_to_analyze)),
  P_Value = numeric(length(columns_to_analyze)),
  S = numeric(length(columns_to_analyze)),
  VarS = numeric(length(columns_to_analyze)),
  Tau = numeric(length(columns_to_analyze)),
  Trend_Label = character(length(columns_to_analyze))
)

# Perform TFPWMK test for each column and extract results
for (i in seq_along(columns_to_analyze)) {
  col <- columns_to_analyze[i]
  result <- tfpwmk(dat[, col]) ## trendfree data analysis
  #result <- pwmk(dat[, col])
  #result <- pbmk(dat[, col])
  result_df[i, "Column"] <- col
  result_df[i, "Z_Value"] <- result[[1]]
  result_df[i, "Sen_Slope"] <- result[[2]]
  result_df[i, "old_Sen_Slope"] <- result[[3]]
  result_df[i, "P_Value"] <- result[[4]]
  result_df[i, "S"] <- result[[5]]
  result_df[i, "VarS"] <- result[[6]]
  result_df[i, "Tau"] <- result[[7]]
  # Trend label based on p-value and slope
  if (result_df[i, "P_Value"] < 0.05) {
    result_df[i, "Trend_Label"] <- ifelse(result_df[i, "Sen_Slope"] > 0, "+", "-")
  } else {
    result_df[i, "Trend_Label"] <- ""
  }
}

# Write the final results to a CSV file
write.csv(result_df, "Trend_TFPWMK_Results_With_Labels_CSDI.csv", row.names = FALSE)
