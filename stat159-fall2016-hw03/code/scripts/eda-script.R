# Read data
advertising <- read.csv("../data/Advertising.csv", sep = ",", row.names = 1)

# Get summary of data and export
tvsummary <- summary(advertising$TV)
salessummary <- summary(advertising$Sales)
sum <- matrix(ncol = 6, nrow = 2)
sum[1,] <- tvsummary
sum[2,] <- salessummary
rownames(sum) <- c('TV', 'Sales')
colnames(sum) <- names(salessummary)
sink(file = "../data/eda-output.txt")
sum
sink()

# Graph output
png(filename = "../images/histogram-tv.png")
hist(advertising$TV, main = "Histogram of TV advertising budgets")
dev.off()

pdf(file = "../images/histogram-tv.pdf")
hist(advertising$TV, main = "Histogram of TV advertising budgets")
dev.off()

png(filename = "../images/histogram-sales.png")
hist(advertising$Sales, main = "Histogram of TV sales")
dev.off()

pdf(file = "../images/histogram-sales.pdf")
hist(advertising$Sales, main = "Histogram of TV sales")
dev.off()

