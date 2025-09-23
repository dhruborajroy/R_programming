setwd("G:/R Programming/Introduction To R/")
library(trendchange)

# Load data
data <- read.csv("ITA/ITA.csv", header = TRUE, stringsAsFactors = FALSE)
annual <- data$SeasonalRainfall
x <- data$SeasonalRainfall
n <- length(annual)

# Split data into equal halves
fh <- sort(x[1:(n/2)])      # First half
sh <- sort(x[((n/2)+1):n])  # Second half

# Mean of halves
mean_fh <- mean(fh)
mean_sh <- mean(sh)

# S-ITA slope
S <- 2 * (mean_fh - mean_sh) / n  # Direction and intensity

# Confidence intervals
ten_LB_95 <- fh - 0.05 * mean(fh)
ten_UB_95 <- fh + 0.05 * mean(fh)
ten_LB_90 <- fh - 0.10 * mean(fh)
ten_UB_90 <- fh + 0.10 * mean(fh)

# Save halves and confidence intervals
write.csv(cbind(fh, sh, ten_LB_95, ten_UB_95, ten_LB_90, ten_UB_90), "ITA/ITA_Barishal.csv", row.names=FALSE)

# Additional statistics
D <- mean((sh - fh) * 10) / mean(fh)
ssd <- (2 * sqrt(2) * sd(x) * sqrt(1 - cor(sh, fh))) / n / sqrt(n)
CLlower90 <- 0 - 1.645 * ssd
CLupper90 <- 0 + 1.645 * ssd
CLlower95 <- 0 - 1.96 * ssd
CLupper95 <- 0 + 1.96 * ssd

# Save summary statistics
write.csv(
  data.frame(S, D, ssd, CLlower90, CLupper90, CLlower95, CLupper95), 
  "ITA/Info_ITA_Barishal1.csv", 
  row.names=FALSE
)
# Custom ITA plot function
innovtrend <- function(x) {
  n <- length(x)
  fh <- sort(x[1:(n/2)])
  sh <- sort(x[((n/2)+1):n])
  ten_LB_95 <- fh - 0.05 * mean(fh)
  ten_UB_95 <- fh + 0.05 * mean(fh)
  ten_LB_90 <- fh - 0.10 * mean(fh)
  ten_UB_90 <- fh + 0.10 * mean(fh)
  
  # Color code for points
  cols <- ifelse(fh > mean(fh), "black", "green")
  
  plot(fh, sh, pch=16, col=cols,
       main="ITA for yearly historical precipitation",
       xlab="first half", xlim=c(min(x), max(x)), ylim=c(min(x), max(x)))
  
  abline(a=0, b=1, lty=1, lwd=1)
  lines(fh, ten_LB_95, lty=2, col="blue", lwd=2)
  lines(fh, ten_UB_95, lty=2, col="blue", lwd=2)
  lines(fh, ten_LB_90, lty=3, col="darkblue", lwd=2)
  lines(fh, ten_UB_90, lty=3, col="darkgreen", lwd=2)
  
  legend(
    "topleft",
    legend = c("No Trend", "QQ 5Percentile", "QQ 10Percentile"),
    lty = c(1, 2, 3),
    col = c("red", "blue", "darkgreen"),
    lwd = c(2, 2, 2),
    cex = 0.9,          # Slightly smaller text
    bty = "n",          # No box around legend (optional)
    inset = 0.02,       # Slightly inset legend from edge
    y.intersp = 1.2     # Increase space between legend entries
  )
  
  
  # Output statistics
  S <- 2 * (mean(fh) - mean(sh)) / n
  D <- mean((sh - fh) * 10) / mean(fh)
  ssd <- (2 * sqrt(2) * sd(x) * sqrt(1 - cor(sh, fh))) / n / sqrt(n)
  CLlower95 <- 0 - 1.96 * ssd
  CLupper95 <- 0 + 1.96 * ssd
  return(list(Slope=S, Indicator=D, Lower95=CLlower95, Upper95=CLupper95))
}

# Run analysis and plot
innovtrend(x)
trendchange::innovtrend(x)



 
# Draw plot with black data points
plot(
  fh, sh, 
  pch=19, 
  col="black",          # black points
  cex=1.5,                # increase point size
  main=expression(bold("Annual")),
  xlab="First Half", ylab="Second Half",
  xlim=c(min(x), max(x)), ylim=c(min(x), max(x)),
  bg="white"            # white background
)
box(col="black", lwd=3)                 # bold black box border
axis(1, col="black", col.axis="black")  # black x-axis
axis(2, col="black", col.axis="black")  # black y-axis
abline(h=pretty(sh), col="grey90", lty=2)  # light horizontal gridlines
abline(v=pretty(fh), col="grey90", lty=2)  # light vertical gridlines
par(bg="white")      

# Add special large purple point for the first data point, if desired
points(fh[1], sh[1], col="purple", pch=19, cex=2)

# black solid trend line
abline(a=0, b=1, col="black", lwd=2)

# red dashed confidence interval lines
lines(fh, ten_LB_95, lty=2, col="red", lwd=3)
lines(fh, ten_UB_95, lty=2, col="red", lwd=3)

# If you want 10 percentile as lighter blue
lines(fh, ten_LB_90, lty=2, col="skyblue", lwd=3) #bottom most line 
lines(fh, ten_UB_90, lty=2, col="skyblue", lwd=3) #top most line

# Add green vertical lines for cutoffs
abline(v=700, col="green", lwd=2)  # Example position, replace with your split
abline(v=1000, col="green", lwd=2) # Example position, replace accordingly

# Add (a)annual label at top left
text(min(fh), max(sh), "(a)annual", adj=c(0,1), font=2)
