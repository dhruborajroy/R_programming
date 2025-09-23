# Load required packages
library(ggplot2)
library(grid)
library(tidyverse)
# Example Data (replace with your own)
set.seed(123)
precip <- round(runif(22, 350, 1250))
precip_1 <- sort(precip[1:11])
precip_2 <- sort(precip[12:22])
ita_df <- data.frame(x = precip_1, y = precip_2)

# Regression model
fit <- lm(y ~ x, ita_df)

# Plot
p <- ggplot(ita_df, aes(x=x, y=y)) +
  geom_point(shape=19, size=4) +                                   # Bold, filled points
  geom_abline(slope=1, intercept=0, color="red", size=1.5) +       # Red solid 1:1 reference line
  geom_smooth(method="lm", color="red", linetype="dashed", se=FALSE, size=1.3) + # Red dashed regression line
  geom_smooth(method="lm", color="blue", linetype="dashed", se=TRUE, fill=NA, size=1) + # Blue dashed confidence band
  
  # Vertical green lines at approx. x=600 and x=900 (adjust to match categories)
  geom_vline(xintercept=c(600, 900), color="green", size=2) +
  
  scale_x_continuous(limits=c(300, 1300), breaks=seq(300,1300,300)) +
  scale_y_continuous(limits=c(300, 1300), breaks=seq(300,1300,300)) +
  
  # Labels and annotation
  annotate("text", x=350, y=1250, label="(c) kiremt", fontface=2, size=10, hjust=0) +
  theme_classic(base_size=18) +
  theme(
    axis.line = element_line(size=2),
    plot.background = element_rect(fill="white", color=NA),
    panel.border = element_rect(color="black", fill=NA, size=2), # Bold box outline
    axis.text = element_text(size=18),
    axis.title = element_blank(),
    axis.ticks = element_line(size=2),
    legend.position="none"
  )

# Draw plot with a thick black outer box
ggdraw() +
  draw_plot(p) +
  theme(plot.background = element_rect(color="black", size=2))

# Save if needed
# ggsave("ITA_kiremt_plot.png", width=7, height=5, dpi=300)

# Note:
# - Replace precip data with your own observed values.
# - Vertical green lines at x=600 and x=900 can be moved by changing xintercept.
# - Adjust sizes and annotation placement to match your image precisely.
