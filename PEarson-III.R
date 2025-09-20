# Using FAdist
install.packages("FAdist")
install.packages("fitdistrplus")

data <- read_csv('Year-Value.csv')
library(fitdistrplus)
library(FAdist)
fitted <- fitdistrplus::fitdist(data$Value, "gumbel", start = list(location = mean(data$Value), scale = sd(data$Value)))
fit <- fitdist(data$Value, "gumbel", start = list(location = mean(data$Value), scale = sd(data$Value)))
fit <- fitdist(data$Value, "gumbel", start = list(location = mean(data$Value), scale = sd(data$Value)))
library(fitdistrplus)

# Define the Gumbel density function: location = a, scale = b
dgumbel <- function(x, a, b) {
  z <- (x - a) / b
  (1 / b) * exp(-z - exp(-z))
}

# Now fit using fitdist
fit <- fitdist(data$Value, "gumbel", start = list(a = mean(data$Value), b = sd(data$Value)),
               custom.dens = dgumbel)
summary(fit)

# Using evd
install.packages("evd")
library(evd)
fit <- fgev(data$Value, type = "Gumbel")






#pearson Type III
# Install required package if not already installed
if (!require("PearsonDS")) {
  install.packages("PearsonDS")
  library(PearsonDS)
}

# Sample data: annual maximum flows (replace with your data)
flood_data <- c(123, 145, 156, 132, 178, 166, 154, 171, 160, 169)

# Calculate moments
mean_flow <- mean(flood_data)
sd_flow <- sd(flood_data)
skew_flow <- sum((flood_data - mean_flow)^3) / ((length(flood_data)-1) * sd_flow^3)

# Pearson III parameters (mean, scale, shape)
shape <- 4/(skew_flow^2)
scale <- 0.5 * sd_flow * abs(skew_flow)
location <- mean_flow - (2 * sd_flow / skew_flow)

moments <- c(mean=mean(flood_data), variance=var(flood_data), skewness=skewness(flood_data), kurtosis=kurtosis(flood_data))
fit <- pearsonFitM(moments=moments)
params <- fit


# Probabilities of exceedance (return periods)
prob <- seq(0.01, 0.99, by=0.01)

# Quantile function for Pearson III (discharge at each probability)
pearsonIII_quantiles <- qpearsonIII(prob, shape=shape, location=location, scale=scale)

# Plot flood frequency curve
plot(1/prob, pearsonIII_quantiles, type="l",
     xlab="Return Period (years)",
     ylab="Flood Magnitude",
     main="Flood Frequency Curve (Pearson III)")

# Add observed maximums for comparison
points(1/(rank(flood_data)/(length(flood_data)+1)), sort(flood_data), col="red", pch=19)
legend("topright", legend=c("Pearson III", "Observed"), col=c("black", "red"), lty=1, pch=19)

# Print fitted parameters
print(params)

