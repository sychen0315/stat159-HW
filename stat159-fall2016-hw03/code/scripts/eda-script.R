# Read data
advertising <- read.csv("../../data/Advertising.csv", sep = ",", row.names = 1)

# Computes summary statistics
tvsummary <- summary(advertising$TV)
radiosummary <- summary(advertising$Radio)
newspapersummary <- summary(advertising$Newspaper)
salessummary <- summary(advertising$Sales)

sum <- matrix(ncol = 6, nrow = 4)
sum[1,] <- tvsummary
sum[2,] <- radiosummary
sum[3,] <- newspapersummary
sum[4,] <- salessummary
rownames(sum) <- c('TV', 'Radio', 'Newspaper','Sales')
colnames(sum) <- names(salessummary)

# Computes matrix of correlations
matrix_cor <- cor(advertising)

# Save results to eda-output.txt
sink(file = "../../data/eda-output.txt")
writeLines("Summary Statistics")
sum
writeLines(" ")
writeLines("Matrix of correlations")
matrix_cor
sink()

# Save results in binary format
save(matrix_cor, file = "../../data/correlation-matrix.RData")


# Graph output
png(filename = "../../images/histogram-tv.png")
hist(advertising$TV, main = "Histogram of TV advertising budgets")
dev.off()

png(file = "../../images/histogram-radio.png")
hist(advertising$TV, main = "Histogram of Radio advertising budgets")
dev.off()

png(file = "../../images/histogram-newspaper.png")
hist(advertising$Sales, main = "Histogram of Newspaper advertising budgets")
dev.off()

png(filename = "../../images/histogram-sales.png")
hist(advertising$Sales, main = "Histogram of Sales")
dev.off()

png(filename = "../../images/histogram-sales.png")
pairs(advertising, main = "Scatterplot matrix of advertising data")
dev.off()
