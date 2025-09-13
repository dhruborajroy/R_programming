# Load libraries
library(ggplot2)
library(reshape2)

# Use built-in dataset
data(mtcars)

# Compute correlation matrix (numeric only)
corr_matrix <- cor(mtcars, use = "complete.obs")

# Convert to long format for ggplot
melted_corr <- melt(corr_matrix)

# Plot heatmap
ggplot(melted_corr, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile(color = "white", size = 1.2) +   # white gridlines
  scale_fill_gradient2(low = "blue", high = "red", mid = "white",
                       midpoint = 0, limit = c(-1,1),
                       name = "Correlation") +
  geom_text(aes(label = sprintf("%.2f", value)), size = 4) +  # annotations
  theme_minimal(base_size = 14) +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1),
        axis.title.x = element_blank(),
        axis.title.y = element_blank())
