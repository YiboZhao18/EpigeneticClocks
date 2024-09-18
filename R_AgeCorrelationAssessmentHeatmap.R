# Install and load required packages
# Hmisc is used for computing correlation and p-values, poolr is for adjusting p-values, GMD is for plotting heatmaps
install.packages("Hmisc")  
install.packages("poolr")
install.packages("GMD")
library(Hmisc)
library(poolr)
library(GMD)

# Set working directory
setwd("wd")  # Replace "wd" with the actual path where the data file is located

# Load the matrix of scaled epigenetic age estimates
# estimate_matrix_scaled is a matrix where:
# - Rows represent sample IDs
# - Columns represent the age estimates from different epigenetic clocks, as well as chronological age
estimate_matrix_scaled <- read.delim("estimate_matrix_scaled.txt", stringsAsFactors = F)

# Compute Pearson correlations and p-values between all pairs of age estimates
# rcorr computes correlation matrix (r), p-values (P), and number of observations (n)
cor_test <- rcorr(as.matrix(estimate_matrix_scaled), type = "pearson")

# Calculate the effective number of independent tests using Nyholt's method
# meff function estimates the number of effective tests based on correlations between clocks
# This accounts for the fact that some of the clocks might be correlated, so we adjust for multiple testing
effective_tests <- meff(cor_test$r, method = "nyholt")

# Adjust p-values using Bonferroni correction based on the number of effective tests
# This step ensures that the significance levels are corrected for multiple comparisons
adjusted_p <- cor_test$P * effective_tests

# Set a maximum value of 1 for adjusted p-values (since no p-value can exceed 1)
adjusted_p[adjusted_p > 1] <- 1

# Define significance levels based on the adjusted p-values
# The "cut" function is used to categorize p-values into different levels of significance:
# - "***" for p < 0.001
# - "**" for p < 0.01
# - "*" for p < 0.05
# - "." for p < 0.1
# - "" for non-significant p-values (p >= 0.1)
significance_levels <- cut(adjusted_p, 
                           breaks = c(-Inf, 0.001, 0.01, 0.05, 0.1, Inf),
                           labels = c("***", "**", "*", ".", ""))

# Create a matrix that combines the rounded correlation coefficients (r) with their corresponding significance symbols
# This matrix will be used to annotate the heatmap cells
label_matrix <- matrix(paste(round(cor_test$r, 2), significance_levels), 
                       nrow = nrow(cor_test$r), ncol = ncol(cor_test$r))

# Plot a heatmap to visualize the correlation matrix with significance symbols
# heatmap.2 is from the GMD package and allows for customized heatmaps
# The following parameters control various aspects of the heatmap:
# - dendrogram = "none": Disable row and column clustering
# - scale = "none": Do not scale the data (use raw correlation values)
# - key = TRUE: Show a color key/legend for the heatmap
# - key.title: Title for the legend
# - labRow and labCol: Use the column names from estimate_matrix_scaled for row/column labels
# - Colv and Rowv = NA: Turn off dendrograms for rows and columns
# - cellnote: Display the label matrix (correlation values + significance symbols) inside the heatmap cells
# - notecol = "black": Set the text color for annotations
# - main: Title for the heatmap
# - margins = c(15, 15): Adjust margins to fit long labels
# - col: Set a color palette (blue for negative correlations, white for neutral, red for positive correlations)
# - tracecol = NA: Disable trace lines within the heatmap
heatmap.2(cor_test$r,
          dendrogram = "none",          # Disable dendrograms
          scale = "none",               # No scaling, use raw correlations
          key = TRUE,                   # Display color key/legend
          key.title = "Correlation",    # Legend title
          labRow = colnames(estimate_matrix_scaled),  # Label rows with age estimates
          labCol = colnames(estimate_matrix_scaled),  # Label columns with age estimates
          Colv = NA,                    # Disable column dendrogram
          Rowv = NA,                    # Disable row dendrogram
          cellnote = label_matrix,      # Show correlation coefficients + significance in heatmap cells
          notecol = "black",            # Annotation text color
          main = "Correlation Matrix with Significance Symbols",  # Heatmap title
          margins = c(15, 15),          # Adjust margins for better label visibility
          col = colorRampPalette(c("blue", "white", "red"))(100), # Color gradient for correlations
          tracecol = NA                 # Disable trace lines inside the heatmap
)

