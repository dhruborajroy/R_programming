# --- Install required package (if not already installed) ---
# install.packages("BreakPoints") # or install.packages("trend")


# --- Example data: replace with your precipitation series ---
precipitation <- c(12.1, 13.2, 11.8, 14.0, 10.9, 25.3, 26.1, 24.8, 25.5, 24.7, 12.8, 13.5, 11.2, 13.8, 12.4)


library(trend)
result <- snh.test(precipitation)
print(result)